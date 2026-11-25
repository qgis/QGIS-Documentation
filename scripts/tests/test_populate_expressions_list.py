"""Run with: python3 -m unittest discover -s scripts/tests -v."""

import json
import random
import re
import runpy
import shutil
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


class PopulateExpressionsListTest(unittest.TestCase):
    # Explicit expected order: related names stay adjacent, with "$" first.
    geometry_names = [
        "$area",
        "area",
        "bounds_height",
        "$geometry",
        "geometry",
        "geometry_n",
        "$length",
        "length",
        "length3D",
        "$perimeter",
        "perimeter",
        "$x",
        "x",
        "$x_at",
        "x_at",
        "$y",
        "y",
        "$y_at",
        "y_at",
        "$z",
        "z",
    ]

    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        root = Path(temporary.name)
        self.script = root / "scripts/populate_expressions_list.py"
        self.script.parent.mkdir()
        shutil.copyfile(
            Path(__file__).resolve().parents[1] / self.script.name, self.script
        )
        self.qgis = root / "QGIS"
        self.help_folder = self.qgis / "resources/function_help/json"
        self.help_folder.mkdir(parents=True)
        self.output = root / "docs/user_manual/expressions/expression_help"
        images = self.output / "img"
        images.mkdir(parents=True)
        caption = {
            "expression_function_GeometryGroup_bounds_height": {
                "img": "bounds_height",
                "caption": "The arrow shows the bounding box height.",
            }
        }
        (images / "images_list.json").write_text(json.dumps(caption), encoding="utf-8")
        # The generator only checks that the image path exists.
        (images / "bounds_height.png").touch()
        for group, names in [
            ("GeometryGroup", self.geometry_names),
            ("Math", ["abs", "round"]),
        ]:
            entries = [{"name": group, "type": "group", "description": group}]
            entries.extend(
                {
                    "name": name,
                    "type": "function",
                    "groups": [group],
                    "description": f"Description of {name}.",
                }
                for name in names
            )
            for entry in entries:
                (self.help_folder / entry["name"]).write_text(
                    json.dumps(entry), encoding="utf-8"
                )

    def generate(self, filenames):
        for output in self.output.glob("*.rst"):
            output.unlink()
        # Control only the filesystem enumeration; execute the actual generator.
        with (
            patch(
                "os.walk", return_value=iter([(str(self.help_folder), [], filenames)])
            ),
            patch.object(sys, "argv", [str(self.script), str(self.qgis)]),
        ):
            runpy.run_path(str(self.script), run_name="__main__")
        return {file.name: file.read_bytes() for file in self.output.glob("*.rst")}

    def test_output_is_identical_for_different_file_orders(self):
        filenames = sorted(file.name for file in self.help_folder.iterdir())
        expected = self.generate(filenames)
        self.assertEqual(set(expected), {"GeometryGroup.rst", "Math.rst"})
        self.assertIn(
            b"The arrow shows the bounding box height.", expected["GeometryGroup.rst"]
        )
        shuffled = filenames.copy()
        random.Random(11274).shuffle(shuffled)
        for order in [list(reversed(filenames)), shuffled]:
            with self.subTest(order=order):
                self.assertEqual(self.generate(order), expected)

    def test_related_names_are_adjacent_with_dollar_variant_first(self):
        filenames = sorted(
            (file.name for file in self.help_folder.iterdir()), reverse=True
        )
        output = self.generate(filenames)["GeometryGroup.rst"].decode("utf-8")
        names = re.findall(
            r"^\.\. _expression_function_GeometryGroup_(.*):$", output, re.MULTILINE
        )
        self.assertEqual(names, self.geometry_names)


if __name__ == "__main__":
    unittest.main()

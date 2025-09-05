{ lib
, stdenv
, fetchFromGitHub

, pyQgisDocumentation

, python3Packages
}:

let
  sphinxext-rediraffe = python3Packages.buildPythonPackage rec {
    pname = "sphinxext-rediraffe";
    version = "0.2.7";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "sphinx-doc";
      repo = "sphinxext-rediraffe";
      rev = "refs/tags/v${version}";
      hash = "sha256-g+GD1ApD26g6PwPOH/ir7aaEgH+n1QQYSr9QizYrmug=";
    };

    # Fix "packaging.version.InvalidVersion: Invalid version: 'main'"
    postPatch = ''
      substituteInPlace "setup.py" \
        --replace-fail 'version = "main"' 'version = "${version}"'
    '';

    build-system = with python3Packages; [
      setuptools
    ];

    dependencies = with python3Packages; [
      sphinx
    ];

    pythonImportsCheck = [ "sphinxext.rediraffe" ];
  };

  sphinx-togglebutton = python3Packages.buildPythonPackage rec {
    pname = "sphinx-togglebutton";
    version = "0.3.2";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "executablebooks";
      repo = "sphinx-togglebutton";
      rev = "refs/tags/v${version}";
      hash = "sha256-i7SshD1giWgDAHpiIBW03OCTLlPO/Y3Ykz0WXGoG5Zg=";
    };

    build-system = with python3Packages; [
      setuptools
    ];

    dependencies = with python3Packages; [
      sphinx
    ];

    pythonImportsCheck = [ "sphinx_togglebutton" ];
  };

  # FIXME: don't hardcode QGIS version
  intersphinxMapping = "${pyQgisDocumentation}/3.42/objects.inv";

in
stdenv.mkDerivation {
  name = "qgis-documentation";

  src = lib.cleanSourceWith {
    src = ../.;
    filter = (
      path: type: (builtins.all (x: x != baseNameOf path) [
        ".git"
        ".github"
        "flake.nix"
        "flake.lock"
        "package.nix"
        "result"
      ])
    );
  };

  postPatch = ''
      # Load intersphinx inventory objects from pre-fetched file
      substituteInPlace "conf.py" \
        --replace-fail \
        "'https://qgis.org/pyqgis/{}/'.format(pyqgis_version), None)}" \
        "'${intersphinxMapping}', '${intersphinxMapping}')}"

    # Fix "WARNING: unsupported theme option 'display_version' given"
    # https://github.com/readthedocs/sphinx_rtd_theme/issues/1623
      substituteInPlace "conf.py" \
        --replace-fail \
        "'display_version': True," \
        "# 'display_verson': True,"
  '';

  buildInputs = with python3Packages; [
    pyyaml
    sphinx
    sphinx-copybutton
    sphinxext-rediraffe
    sphinx-intl
    sphinx-rtd-theme
    sphinx-tabs
    sphinx-togglebutton
  ];

  buildPhase = ''
    # List of languages taken from Makefile
    LANGUAGES="en bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh_Hant zh_Hans"

    for LANG in $LANGUAGES; do
    	if [ "$LANG" != "en" ]; then
    		sphinx-build -b html . build/html/$LANG -D language=$LANG -t i18n
    	else
    		sphinx-build -b html -nW --keep-going . build/html/$LANG
    	fi
    done
  '';

  installPhase = ''
    mkdir -p $out
    cp -r build/html/* $out/
  '';
}


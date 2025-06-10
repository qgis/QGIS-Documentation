{
  description = "Run QGIS with extra Python packages";

  inputs.geospatial.url = "github:imincik/geospatial-nix.repo";
  inputs.nixpkgs.follows = "geospatial/nixpkgs";

  outputs = { self, geospatial, nixpkgs }: {
    packages.x86_64-linux.default =
      let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
        qgisWithExtras = geospatial.packages.x86_64-linux.qgis.override {
          extraPythonPackages = ps: [
            ps.pyqtwebengine
            ps.jsonschema
            ps.debugpy
            ps.future
            ps.psutil
          ];
        };
      in qgisWithExtras;
    packages.x86_64-linux.qgis-ltr =
      let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
        qgisWithExtras = geospatial.packages.x86_64-linux.qgis-ltr.override {
          extraPythonPackages = ps: [
            ps.pyqtwebengine
            ps.jsonschema
            ps.debugpy
            ps.future
            ps.psutil
          ];
        };
      in qgisWithExtras;
  };
}


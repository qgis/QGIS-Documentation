{
  description = "Run QGIS with extra Python packages";

  inputs.geospatial.url = "github:imincik/geospatial-nix.repo";
  inputs.nixpkgs.follows = "geospatial/nixpkgs";

  outputs = { self, geospatial, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      extraPythonPackages = ps: [
        ps.pyqtwebengine
        ps.jsonschema
        ps.debugpy
        ps.future
        ps.psutil
      ];
      qgisWithExtras = geospatial.packages.${system}.qgis.override {
        inherit extraPythonPackages;
      };
      qgisLtrWithExtras = geospatial.packages.${system}.qgis-ltr.override {
        inherit extraPythonPackages;
      };
    in {
      packages.${system} = {
        default = qgisWithExtras;
        qgis-ltr = qgisLtrWithExtras;
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.gum
          pkgs.gource
          pkgs.ffmpeg
          pkgs.chafa
          pkgs.pre-commit
          pkgs.nixfmt-rfc-style
          (pkgs.python3.withPackages (ps: [
            ps.pip
            ps.setuptools
            ps.sphinx
            ps.sphinx_rtd_theme
            ps.recommonmark
            ps.myst-parser
            ps.sphinx-autobuild
            ps.docutils
            ps.rstcheck
            ps.sphinxext-rediraffe
            ps.sphinx-togglebutton
            ps.sphinx-copybutton
          ]))
          pkgs.vscode
          pkgs.transifex-cli
          pkgs.texlive.combined.scheme-full
        ];
        shellHook = ''
          
          #source ${./scripts/shell-hook.sh}
        '';
      };
    };
}


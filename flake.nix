{
  description = "QGIS Documentation";

  nixConfig = {
    #   extra-substituters = [ "https://example.cachix.org" ];
    #   extra-trusted-public-keys = [ "example.cachix.org-1:xxxx=" ];

    # IFD is required for QGIS repo.
    allow-import-from-derivation = true;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    qgisPyQgisDocumentationRepo = {
      # FIXME: https://github.com/qgis/QGIS-Sysadmin-Documentation/issues/137
      url = "github:imincik/pyqgis-api-docs-builder/nix-package";
    };
  };

  outputs = inputs@{ self, nixpkgs, qgisPyQgisDocumentationRepo }:

    let
      # Flake system
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });

    in
    {
      #
      ### PACKAGES
      #

      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};

        in
        {
          # TODO: add docs-master and docs-ltr versions
          docs-latest = pkgs.callPackage ./nix/package.nix {
            pyQgisDocumentation = qgisPyQgisDocumentationRepo.packages.${system}.docs-latest;
          };

          # FIXME
          # default = docs-master;
        });


      #
      ### APPS
      #

      apps = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
          inherit (nixpkgs) lib;

          wwwLauncherLatest = pkgs.writeShellApplication {
            name = "website";
            runtimeInputs = [ pkgs.python3 ];
            text = ''
              exec ${lib.getExe pkgs.python3} \
                -m http.server 8000 \
                -d ${self.packages.${system}.docs-latest}/
            '';
          };

        in
        rec {
          docs-latest = {
            type = "app";
            program = "${wwwLauncherLatest}/bin/website";
          };

          default = docs-latest;
        });


      #
      ### SHELLS
      #

      devShells = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};

          pythonPackages = pkgs.python3Packages;
        in
        {
          # Development environment
          default = pkgs.mkShell {
            name = "impurePythonEnv";
            venvDir = "./.venv";
            buildInputs = [
              # A Python interpreter including the 'venv' module is required to bootstrap
              # the environment.
              pythonPackages.python

              # This executes some shell code to initialize a venv in $venvDir before
              # dropping into the shell
              pythonPackages.venvShellHook
              pkgs.vscode
              pkgs.transifex-cli

              # Those are dependencies that we would like to use from nixpkgs, which will
              # add them to PYTHONPATH and thus make them accessible from within the venv.
            ];

            # Run this command, only after creating the virtual environment
            postVenvCreation = ''
              export DIRENV_LOG_FORMAT=
              unset SOURCE_DATE_EPOCH
              pip install -r REQUIREMENTS.txt
              echo "-----------------------"
              echo "🌈 Your Dev Environment is prepared."
              echo "📒 Note:"
              echo "-----------------------"
              echo "start vscode like this:"
              echo ""
              echo "./vscode.sh"
              echo "-----------------------"
            '';

            # Now we can execute any commands within the virtual environment.
            # This is optional and can be left out to run pip manually.
            postShellHook = ''
              # allow pip to install wheels
              unset SOURCE_DATE_EPOCH
            '';
          };
        });
    };
}

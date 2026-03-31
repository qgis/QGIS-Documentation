{
  description = "QGIS Documentation development environment";

  inputs = {
    geospatial.url = "github:imincik/geospatial-nix.repo";
    nixpkgs.follows = "geospatial/nixpkgs";
  };

  outputs = { self, geospatial, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      extraPythonPackages = ps: [
        ps.pyqtwebengine
        ps.jsonschema
        ps.debugpy
        ps.future
        ps.psutil
      ];

      mkPackages = system:
        let
          hasQgis = geospatial.packages ? ${system};
        in
        if hasQgis then {
          default = geospatial.packages.${system}.qgis.override {
            inherit extraPythonPackages;
          };
          qgis-ltr = geospatial.packages.${system}.qgis-ltr.override {
            inherit extraPythonPackages;
          };
        } else { };

      mkDevShell = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };
        in
        pkgs.mkShell {
          packages = [
            pkgs.gum
            pkgs.gource
            pkgs.ffmpeg
            pkgs.chafa
            pkgs.pre-commit
            pkgs.nixfmt-rfc-style
            pkgs.codespell
            pkgs.yamllint
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
              ps.doc8
              ps.sphinxext-rediraffe
              ps.sphinx-togglebutton
              ps.sphinx-copybutton
              ps.sphinx-tabs
            ]))
            pkgs.transifex-cli
            pkgs.texlive.combined.scheme-medium
            # Image optimization tools
            pkgs.optipng
            pkgs.pngquant
            pkgs.jpegoptim
            pkgs.oxipng
            # Parallel build tools
            pkgs.parallel
            # Benchmarking tools
            pkgs.bc
          ];

          shellHook = ''
            echo ""
            echo -e "\033[1;34m╔══════════════════════════════════════════════════════════════════╗\033[0m"
            echo -e "\033[1;34m║\033[0m       \033[1;33mQGIS Documentation Development Environment\033[0m              \033[1;34m║\033[0m"
            echo -e "\033[1;34m╚══════════════════════════════════════════════════════════════════╝\033[0m"
            echo ""
            echo -e "\033[1;36m BUILD COMMANDS\033[0m"
            echo -e " ───────────────────────────────────────────────────────────────────"
            echo -e " \033[1mmake fasthtml\033[0m          Build HTML (fast, parallel)"
            echo -e " \033[1mmake html\033[0m              Build HTML (strict, warnings as errors)"
            echo -e " \033[1mmake pdf\033[0m               Build PDF documentation"
            echo -e " \033[1mmake serve\033[0m             Live preview server (auto-reload)"
            echo ""
            echo -e "\033[1;36m TRANSLATION WORKFLOW\033[0m"
            echo -e " ───────────────────────────────────────────────────────────────────"
            echo -e " \033[1mmake pull-translations\033[0m Pull all translations from Transifex"
            echo -e " \033[1mmake i18n-html\033[0m         Pull translations + build all HTML"
            echo -e " \033[1mmake i18n-full\033[0m         Pull translations + build all formats"
            echo -e " \033[1mmake html-all\033[0m          Build all languages (no pull)"
            echo ""
            echo -e "\033[1;36m QUALITY & UTILITIES\033[0m"
            echo -e " ───────────────────────────────────────────────────────────────────"
            echo -e " \033[1mmake linkcheck\033[0m         Check for broken links"
            echo -e " \033[1mmake doctest\033[0m           Run documentation tests"
            echo -e " \033[1mpre-commit run --all\033[0m   Run all pre-commit checks"
            echo -e " \033[1m./scripts/optimize_images.sh\033[0m  Optimize built images"
            echo ""
            echo -e "\033[1;36m BENCHMARKING\033[0m"
            echo -e " ───────────────────────────────────────────────────────────────────"
            echo -e " \033[1mmake benchmark-quick\033[0m   Quick build performance test"
            echo -e " \033[1mmake benchmark\033[0m         Standard benchmark (3 runs)"
            echo ""
            echo -e "\033[1;36m CLEANING\033[0m"
            echo -e " ───────────────────────────────────────────────────────────────────"
            echo -e " \033[1mmake springclean\033[0m       Remove all build artifacts"
            echo ""
            echo -e " \033[0;90mTip: Use 'nix run .#<command>' for standalone execution\033[0m"
            echo -e " \033[0;90mTip: In Neovim, use <leader>p for project menu\033[0m"
            echo ""
          '';
        };

      mkDevShellWithVscode = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };
          baseShell = mkDevShell system;
        in
        pkgs.mkShell {
          inputsFrom = [ baseShell ];
          packages = [ pkgs.vscode ];
        };

      # Helper to create app scripts with meta
      mkApp = system: name: description: script:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };
          pythonEnv = pkgs.python3.withPackages (ps: [
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
            ps.sphinx-tabs
          ]);
          scriptContent = ''
            #!${pkgs.bash}/bin/bash
            export PATH="${pythonEnv}/bin:${pkgs.gnumake}/bin:${pkgs.coreutils}/bin:${pkgs.optipng}/bin:${pkgs.pngquant}/bin:${pkgs.findutils}/bin:${pkgs.parallel}/bin:${pkgs.gnutar}/bin:${pkgs.gzip}/bin:${pkgs.bc}/bin:$PATH"
            cd "$(dirname "$0")/../.." 2>/dev/null || cd .
            ${script}
          '';
        in
        {
          type = "app";
          program = toString (pkgs.writeShellScript name scriptContent);
          meta = {
            description = description;
            mainProgram = name;
          };
        };

      mkApps = system: {
        # Documentation builds
        html = mkApp system "build-html" "Build HTML documentation (strict mode)" "make html";
        fasthtml = mkApp system "build-fasthtml" "Build HTML documentation (fast mode)" "make fasthtml";
        draft = mkApp system "build-draft" "Build HTML documentation (draft/quiet mode)" "make draft";
        pdf = mkApp system "build-pdf" "Build PDF documentation" "make pdf";
        full = mkApp system "build-full" "Build full documentation (HTML + PDF)" "make full";

        # Development server
        serve = mkApp system "serve" "Start live-reload documentation server" "make serve";

        # Quality checks
        linkcheck = mkApp system "linkcheck" "Check for broken links" "make linkcheck";
        doctest = mkApp system "doctest" "Run documentation tests" "make doctest";

        # Cleaning
        clean = mkApp system "clean" "Clean all build artifacts" "make springclean";
        clean-html = mkApp system "clean-html" "Clean HTML build directory" "rm -rf build/html && echo 'HTML build cleaned'";
        clean-pdf = mkApp system "clean-pdf" "Clean PDF build directory" "rm -rf build/latex build/pdf && echo 'PDF build cleaned'";

        # Translations
        gettext = mkApp system "gettext" "Generate POT translation files" "make gettext";
        tx-pull = mkApp system "tx-pull" "Pull all translations from Transifex" "make pull-translations";
        pull-translations = mkApp system "pull-translations" "Pull all translations from Transifex" "make pull-translations";

        # Utilities
        rstcheck = mkApp system "rstcheck" "Check RST syntax" "rstcheck docs/";

        # Image optimization (build output)
        optimize-images = mkApp system "optimize-images" "Optimize built images (lossless)" "./scripts/optimize_images.sh";
        optimize-images-lossy = mkApp system "optimize-images-lossy" "Optimize built images (lossy)" "./scripts/optimize_images.sh --lossy";
        optimize-images-dry = mkApp system "optimize-images-dry" "Preview built image optimization" "./scripts/optimize_images.sh --dry-run";

        # Translation workflow (parallel builds)
        i18n-html = mkApp system "i18n-html" "Pull translations and build all HTML" "./scripts/build_all_languages.sh --pull --html";
        i18n-pdf = mkApp system "i18n-pdf" "Pull translations and build all PDFs" "./scripts/build_all_languages.sh --pull --pdf";
        i18n-full = mkApp system "i18n-full" "Pull translations and build all formats" "./scripts/build_all_languages.sh --pull --full";
        html-all = mkApp system "html-all" "Build all languages HTML" "./scripts/build_all_languages.sh --html";
        pdf-all = mkApp system "pdf-all" "Build all languages PDF" "./scripts/build_all_languages.sh --pdf";
        full-all = mkApp system "full-all" "Build all languages (full)" "./scripts/build_all_languages.sh --full";
        i18n-clean = mkApp system "i18n-clean" "Clean, pull, and rebuild all" "./scripts/build_all_languages.sh --pull --full --clean";

        # Benchmarking
        benchmark = mkApp system "benchmark" "Benchmark build performance (3 runs)" "./scripts/benchmark_build.sh --runs 3";
        benchmark-quick = mkApp system "benchmark-quick" "Quick build benchmark" "./scripts/benchmark_build.sh --quick";
        benchmark-full = mkApp system "benchmark-full" "Full benchmark with clean builds" "./scripts/benchmark_build.sh --full --runs 3 --output build/benchmark_results.md";
      };

    in
    {
      packages = forAllSystems mkPackages;

      devShells = forAllSystems (system: {
        default = mkDevShell system;
        with-vscode = mkDevShellWithVscode system;
      });

      apps = forAllSystems mkApps;
    };
}

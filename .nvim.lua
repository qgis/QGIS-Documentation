-- QGIS Documentation Project Configuration for Neovim
-- All project shortcuts under <leader>p

local ok, wk = pcall(require, "which-key")
if not ok then
  vim.notify("which-key not installed, project keybindings not loaded", vim.log.levels.WARN)
  return
end

-- Helper to run terminal commands
local function term_cmd(cmd, opts)
  opts = opts or {}
  return function()
    local term_opts = {
      direction = opts.direction or "float",
      close_on_exit = opts.close_on_exit or false,
      dir = vim.fn.getcwd(),
    }
    -- Try toggleterm first, fall back to built-in terminal
    local tt_ok, toggleterm = pcall(require, "toggleterm.terminal")
    if tt_ok then
      local Terminal = toggleterm.Terminal
      local term = Terminal:new(vim.tbl_extend("force", { cmd = cmd }, term_opts))
      term:toggle()
    else
      vim.cmd("split | terminal " .. cmd)
    end
  end
end

-- Helper to run shell command and notify
local function shell_cmd(cmd, msg)
  return function()
    vim.notify(msg or ("Running: " .. cmd), vim.log.levels.INFO)
    vim.fn.jobstart(cmd, {
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("✓ " .. (msg or cmd) .. " completed", vim.log.levels.INFO)
        else
          vim.notify("✗ " .. (msg or cmd) .. " failed (exit " .. code .. ")", vim.log.levels.ERROR)
        end
      end,
    })
  end
end

-- Helper to open URL in browser
local function open_url(url)
  return function()
    local open_cmd
    if vim.fn.has("mac") == 1 then
      open_cmd = "open"
    elseif vim.fn.has("unix") == 1 then
      open_cmd = "xdg-open"
    else
      open_cmd = "start"
    end
    vim.fn.jobstart({ open_cmd, url })
  end
end

-- Helper to run build command and prompt to open docs after
local function build_and_prompt(cmd, lang)
  lang = lang or "en"
  return function()
    local tt_ok, toggleterm = pcall(require, "toggleterm.terminal")
    if tt_ok then
      local Terminal = toggleterm.Terminal
      local term = Terminal:new({
        cmd = cmd,
        direction = "float",
        close_on_exit = false,
        on_exit = function(_, _, exit_code)
          if exit_code == 0 then
            vim.schedule(function()
              vim.ui.select({ "Yes", "No" }, {
                prompt = "Build complete! Open docs in browser?",
              }, function(choice)
                if choice == "Yes" then
                  local doc_path = vim.fn.getcwd() .. "/build/html/" .. lang .. "/index.html"
                  if vim.fn.filereadable(doc_path) == 1 then
                    open_url("file://" .. doc_path)()
                  else
                    open_url("http://localhost:8000")()
                  end
                end
              end)
            end)
          end
        end,
      })
      term:toggle()
    else
      -- Fallback without prompt
      vim.cmd("split | terminal " .. cmd)
    end
  end
end

-- ============================================================================
-- Diagnostics / Error Navigation Helper Functions
-- (Must be defined before wk.add() references them)
-- ============================================================================

-- Parse Sphinx build output and populate quickfix list
local function parse_sphinx_errors(log_file)
  log_file = log_file or "build/sphinx_errors.log"

  -- Try multiple possible log locations
  local log_files = {
    "build/sphinx_errors.log",
    "build/benchmark_auto.log",
    "build/benchmark_1.log",
  }

  local found_log = nil

  -- Check each log file location
  for _, lf in ipairs(log_files) do
    local f = io.open(lf, "r")
    if f then
      f:close()
      found_log = lf
      break
    end
  end

  if not found_log then
    -- Try to find the most recent log
    local handle = io.popen("find build -name '*.log' -newer Makefile 2>/dev/null | head -1")
    if handle then
      found_log = handle:read("*l")
      handle:close()
    end
  end

  if not found_log or found_log == "" then
    vim.notify("No recent build log found. Run a build first.", vim.log.levels.WARN)
    return
  end

  local file = io.open(found_log, "r")
  if not file then
    vim.notify("Could not open log: " .. found_log, vim.log.levels.ERROR)
    return
  end

  local qf_items = {}

  for line in file:lines() do
    -- Match various Sphinx warning/error patterns
    local filepath, lnum, msg

    -- Pattern: /path/file.rst:123: WARNING: message
    filepath, lnum, msg = line:match("([^:]+%.rst):(%d+):%s*WARNING:%s*(.+)")
    if not filepath then
      filepath, lnum, msg = line:match("([^:]+%.rst):(%d+):%s*ERROR:%s*(.+)")
    end
    if not filepath then
      -- Pattern: file.rst:123: message (without WARNING/ERROR prefix)
      filepath, lnum, msg = line:match("([^:]+%.rst):(%d+):%s*(.+)")
    end

    if filepath and lnum and msg then
      -- Make path relative if absolute
      filepath = filepath:gsub(vim.fn.getcwd() .. "/", "")
      table.insert(qf_items, {
        filename = filepath,
        lnum = tonumber(lnum),
        col = 1,
        text = msg,
        type = msg:match("ERROR") and "E" or "W",
      })
    end
  end

  file:close()

  if #qf_items == 0 then
    vim.notify("No warnings or errors found in: " .. found_log, vim.log.levels.INFO)
    return
  end

  vim.fn.setqflist(qf_items)
  vim.cmd("copen")
  vim.notify(string.format("Found %d issues in %s. Use ]q/[q to navigate.", #qf_items, found_log), vim.log.levels.INFO)
end

-- Run build and capture errors to quickfix
local function build_and_capture_errors(cmd)
  return function()
    local log_file = "build/sphinx_errors.log"

    vim.notify("Building and capturing errors...", vim.log.levels.INFO)

    vim.fn.jobstart(cmd .. " 2>&1 | tee " .. log_file, {
      on_exit = function(_, exit_code)
        vim.schedule(function()
          -- Parse the log file for errors
          local file = io.open(log_file, "r")
          if not file then
            vim.notify("Build completed but no log file found", vim.log.levels.WARN)
            return
          end

          local qf_items = {}

          for line in file:lines() do
            -- Match various Sphinx warning/error patterns
            local filepath, lnum, msg

            -- Pattern: /path/file.rst:123: WARNING: message
            filepath, lnum, msg = line:match("([^:]+%.rst):(%d+):%s*WARNING:%s*(.+)")
            if not filepath then
              filepath, lnum, msg = line:match("([^:]+%.rst):(%d+):%s*ERROR:%s*(.+)")
            end
            if not filepath then
              -- Pattern: file.rst:123: message (without WARNING/ERROR prefix)
              filepath, lnum, msg = line:match("([^:]+%.rst):(%d+):%s*(.+)")
            end

            if filepath and lnum and msg then
              -- Make path relative if absolute
              filepath = filepath:gsub(vim.fn.getcwd() .. "/", "")
              table.insert(qf_items, {
                filename = filepath,
                lnum = tonumber(lnum),
                col = 1,
                text = msg,
                type = msg:match("ERROR") and "E" or "W",
              })
            end
          end

          file:close()

          if #qf_items > 0 then
            vim.fn.setqflist(qf_items)
            vim.cmd("copen")
            vim.notify(string.format("Build finished with %d issues", #qf_items), vim.log.levels.WARN)
          else
            vim.notify("Build completed successfully!", vim.log.levels.INFO)
          end
        end)
      end,
    })
  end
end

-- Check RST syntax and populate quickfix
local function rstcheck_to_quickfix()
  vim.notify("Running rstcheck...", vim.log.levels.INFO)

  vim.fn.jobstart("rstcheck --report-level warning docs/ 2>&1", {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if not data then return end

      local qf_items = {}

      for _, line in ipairs(data) do
        -- Pattern: docs/path/file.rst:123: (WARNING/2) message
        local filepath, lnum, severity, msg = line:match("([^:]+%.rst):(%d+):%s*%((%w+)/%d+%)%s*(.+)")

        if filepath and lnum then
          table.insert(qf_items, {
            filename = filepath,
            lnum = tonumber(lnum),
            col = 1,
            text = msg or line,
            type = severity == "ERROR" and "E" or "W",
          })
        end
      end

      vim.schedule(function()
        if #qf_items > 0 then
          vim.fn.setqflist(qf_items)
          vim.cmd("copen")
          vim.notify(string.format("rstcheck found %d issues", #qf_items), vim.log.levels.WARN)
        else
          vim.notify("rstcheck: No issues found!", vim.log.levels.INFO)
        end
      end)
    end,
  })
end

-- ============================================================================

-- Helper to run i18n build and prompt to open language selector
local function i18n_build_and_prompt(cmd)
  return function()
    local tt_ok, toggleterm = pcall(require, "toggleterm.terminal")
    if tt_ok then
      local Terminal = toggleterm.Terminal
      local term = Terminal:new({
        cmd = cmd,
        direction = "float",
        close_on_exit = false,
        on_exit = function(_, _, exit_code)
          if exit_code == 0 then
            vim.schedule(function()
              -- Get available built languages
              local handle = io.popen("ls -d build/html/*/ 2>/dev/null | xargs -n1 basename")
              local langs = {}
              if handle then
                for lang in handle:lines() do
                  table.insert(langs, lang)
                end
                handle:close()
              end

              if #langs > 0 then
                table.insert(langs, "Cancel")
                vim.ui.select(langs, {
                  prompt = "Build complete! Open which language?",
                }, function(choice)
                  if choice and choice ~= "Cancel" then
                    local doc_path = vim.fn.getcwd() .. "/build/html/" .. choice .. "/index.html"
                    open_url("file://" .. doc_path)()
                  end
                end)
              end
            end)
          end
        end,
      })
      term:toggle()
    else
      vim.cmd("split | terminal " .. cmd)
    end
  end
end

-- Language selector for builds
local function select_language(callback)
  local languages = { "en", "de", "es", "fr", "it", "ja", "ko", "nl", "pt_BR", "pt_PT", "ru", "zh_Hans" }
  vim.ui.select(languages, {
    prompt = "Select language:",
    format_item = function(item)
      local names = {
        en = "English",
        de = "German",
        es = "Spanish",
        fr = "French",
        it = "Italian",
        ja = "Japanese",
        ko = "Korean",
        nl = "Dutch",
        pt_BR = "Portuguese (Brazil)",
        pt_PT = "Portuguese (Portugal)",
        ru = "Russian",
        zh_Hans = "Chinese (Simplified)",
      }
      return item .. " - " .. (names[item] or item)
    end,
  }, function(choice)
    if choice then
      callback(choice)
    end
  end)
end

-- Register which-key mappings
wk.add({
  { "<leader>p", group = "Project (QGIS Docs)" },

  -- Build submenu
  { "<leader>pb", group = "Build" },
  { "<leader>pbh", build_and_prompt("make fasthtml", "en"), desc = "Build HTML fast (English)" },
  { "<leader>pbH", build_and_prompt("make html", "en"), desc = "Build HTML strict (English)" },
  { "<leader>pbd", term_cmd("make draft"), desc = "Build draft (quiet)" },
  {
    "<leader>pbl",
    function()
      select_language(function(lang)
        build_and_prompt("make LANG=" .. lang .. " html", lang)()
      end)
    end,
    desc = "Build HTML (select language)",
  },
  { "<leader>pbp", build_and_prompt("make pdf", "en"), desc = "Build PDF (English)" },
  {
    "<leader>pbP",
    function()
      select_language(function(lang)
        build_and_prompt("make LANG=" .. lang .. " pdf", lang)()
      end)
    end,
    desc = "Build PDF (select language)",
  },
  { "<leader>pbf", build_and_prompt("make full", "en"), desc = "Build Full (HTML + PDF)" },
  { "<leader>pba", i18n_build_and_prompt("make html-all"), desc = "Build All Languages" },
  { "<leader>pbz", term_cmd("make zip"), desc = "Build ZIP archive" },

  -- Preview/Serve submenu
  { "<leader>ps", group = "Serve/Preview" },
  {
    "<leader>pss",
    term_cmd("make serve", { close_on_exit = false }),
    desc = "Live preview (autobuild)",
  },
  { "<leader>pso", open_url("http://localhost:8000"), desc = "Open in browser" },
  { "<leader>psb", open_url("build/html/en/index.html"), desc = "Open built HTML" },

  -- Quality/Testing submenu
  { "<leader>pq", group = "Quality/Testing" },
  { "<leader>pql", term_cmd("make linkcheck"), desc = "Check links" },
  { "<leader>pqd", term_cmd("make doctest"), desc = "Run doctests" },
  { "<leader>pqr", term_cmd("rstcheck docs/"), desc = "RST syntax check" },
  { "<leader>pqp", term_cmd("pre-commit run --all-files"), desc = "Pre-commit (all)" },
  { "<leader>pqP", term_cmd("pre-commit run"), desc = "Pre-commit (staged)" },

  -- Translation submenu
  { "<leader>pt", group = "Translation" },
  { "<leader>ptg", term_cmd("make gettext"), desc = "Generate POT files" },
  { "<leader>ptp", term_cmd("make tx_force_pull_translations"), desc = "Pull translations (tx)" },
  { "<leader>pts", term_cmd("tx status"), desc = "Transifex status" },

  -- Full i18n workflow (parallel builds)
  { "<leader>pT", group = "i18n Full Workflow" },
  { "<leader>pTh", i18n_build_and_prompt("./scripts/build_all_languages.sh --pull --html"), desc = "Pull + build all HTML" },
  { "<leader>pTp", i18n_build_and_prompt("./scripts/build_all_languages.sh --pull --pdf"), desc = "Pull + build all PDF" },
  { "<leader>pTf", i18n_build_and_prompt("./scripts/build_all_languages.sh --pull --full"), desc = "Pull + build all (full)" },
  { "<leader>pTH", i18n_build_and_prompt("./scripts/build_all_languages.sh --html"), desc = "Build all HTML (no pull)" },
  { "<leader>pTP", i18n_build_and_prompt("./scripts/build_all_languages.sh --pdf"), desc = "Build all PDF (no pull)" },
  { "<leader>pTc", i18n_build_and_prompt("./scripts/build_all_languages.sh --pull --full --clean"), desc = "Clean + pull + build all" },
  { "<leader>pTq", i18n_build_and_prompt("./scripts/build_all_languages.sh --html --languages 'en,de,fr'"), desc = "Quick build (en,de,fr)" },
  { "<leader>pTd", term_cmd("./scripts/build_all_languages.sh --dry-run --pull --full"), desc = "Dry run (preview)" },
  {
    "<leader>pTl",
    function()
      vim.ui.input({ prompt = "Languages (comma-separated): " }, function(input)
        if input then
          i18n_build_and_prompt("./scripts/build_all_languages.sh --pull --html --languages '" .. input .. "'")()
        end
      end)
    end,
    desc = "Custom language selection",
  },

  -- Clean submenu
  { "<leader>pc", group = "Clean" },
  { "<leader>pcs", term_cmd("make springclean"), desc = "Spring clean (full)" },
  { "<leader>pcb", shell_cmd("rm -rf build/html", "Cleaning HTML build"), desc = "Clean HTML build" },
  { "<leader>pcl", shell_cmd("rm -rf build/latex build/pdf", "Cleaning LaTeX/PDF"), desc = "Clean LaTeX/PDF" },

  -- QGIS submenu
  { "<leader>pQ", group = "QGIS" },
  { "<leader>pQq", term_cmd("nix run .#default"), desc = "Run QGIS" },
  { "<leader>pQl", term_cmd("nix run .#qgis-ltr"), desc = "Run QGIS LTR" },
  { "<leader>pQs", term_cmd("./scripts/start_qgis.sh"), desc = "Start QGIS (script)" },
  { "<leader>pQL", term_cmd("./scripts/start_qgis_ltr.sh"), desc = "Start QGIS LTR (script)" },

  -- Nix/Environment submenu
  { "<leader>pn", group = "Nix/Environment" },
  { "<leader>pnd", term_cmd("nix develop"), desc = "Enter dev shell" },
  { "<leader>pnv", term_cmd("nix develop .#with-vscode"), desc = "Dev shell + VSCode" },
  { "<leader>pnu", term_cmd("nix flake update"), desc = "Update flake inputs" },
  { "<leader>pnc", term_cmd("nix flake check"), desc = "Check flake" },
  { "<leader>pnl", term_cmd("nix flake lock"), desc = "Lock flake" },

  -- Nix Run Apps submenu (standalone, no nix develop needed)
  { "<leader>pr", group = "Nix Run (standalone)" },
  -- Build apps
  { "<leader>prh", term_cmd("nix run .#fasthtml"), desc = "Build HTML fast" },
  { "<leader>prH", term_cmd("nix run .#html"), desc = "Build HTML strict" },
  { "<leader>prd", term_cmd("nix run .#draft"), desc = "Build draft" },
  { "<leader>prp", term_cmd("nix run .#pdf"), desc = "Build PDF" },
  { "<leader>prf", term_cmd("nix run .#full"), desc = "Build full" },
  -- Server
  { "<leader>prs", term_cmd("nix run .#serve", { close_on_exit = false }), desc = "Live server" },
  -- Quality
  { "<leader>prl", term_cmd("nix run .#linkcheck"), desc = "Link check" },
  { "<leader>prt", term_cmd("nix run .#doctest"), desc = "Doctest" },
  { "<leader>prr", term_cmd("nix run .#rstcheck"), desc = "RST check" },
  -- Clean
  { "<leader>prc", term_cmd("nix run .#clean"), desc = "Clean all" },
  { "<leader>prC", term_cmd("nix run .#clean-html"), desc = "Clean HTML" },
  -- Translations
  { "<leader>prg", term_cmd("nix run .#gettext"), desc = "Generate POT" },
  { "<leader>prx", term_cmd("nix run .#tx-pull"), desc = "Pull translations" },
  -- i18n full workflow (nix)
  { "<leader>prI", term_cmd("nix run .#i18n-html", { close_on_exit = false }), desc = "i18n: pull + all HTML" },
  { "<leader>prP", term_cmd("nix run .#i18n-pdf", { close_on_exit = false }), desc = "i18n: pull + all PDF" },
  { "<leader>prF", term_cmd("nix run .#i18n-full", { close_on_exit = false }), desc = "i18n: pull + full" },
  { "<leader>prA", term_cmd("nix run .#html-all", { close_on_exit = false }), desc = "Build all HTML" },

  -- Git submenu
  { "<leader>pg", group = "Git" },
  { "<leader>pgs", term_cmd("git status"), desc = "Status" },
  { "<leader>pgd", term_cmd("git diff"), desc = "Diff" },
  { "<leader>pgD", term_cmd("git diff --staged"), desc = "Diff staged" },
  { "<leader>pgl", term_cmd("git log --oneline -20"), desc = "Log (recent)" },
  { "<leader>pgp", term_cmd("git pull --rebase"), desc = "Pull (rebase)" },
  { "<leader>pgf", term_cmd("git fetch --all"), desc = "Fetch all" },

  -- Utility submenu
  { "<leader>pu", group = "Utilities" },
  { "<leader>puc", term_cmd("./scripts/clean_unused_images.sh"), desc = "Clean unused images" },
  { "<leader>pur", term_cmd("./scripts/rstcleanup.sh"), desc = "RST cleanup" },
  { "<leader>puf", term_cmd("./scripts/strings_fixer.sh"), desc = "Fix strings" },
  { "<leader>puv", term_cmd("./scripts/fix_versions.sh"), desc = "Fix versions" },

  -- Image optimization submenu
  { "<leader>pi", group = "Image Optimization" },
  { "<leader>pid", term_cmd("./scripts/optimize_images.sh --dry-run"), desc = "Dry run (preview)" },
  { "<leader>pil", term_cmd("./scripts/optimize_images.sh"), desc = "Lossless optimize" },
  { "<leader>piL", term_cmd("./scripts/optimize_images.sh --lossy"), desc = "Lossy optimize" },
  {
    "<leader>pif",
    function()
      -- Get image path from current line (works in RST files)
      local line = vim.fn.getline(".")
      local img_path = line:match(":file:%s*([^%s]+)") or line:match("%.%.%s+image::%s*([^%s]+)")
      if img_path then
        -- Resolve relative to current file's directory
        local current_dir = vim.fn.expand("%:p:h")
        local full_path = current_dir .. "/" .. img_path
        if vim.fn.filereadable(full_path) == 1 then
          term_cmd("./scripts/optimize_images.sh " .. vim.fn.shellescape(full_path))()
        else
          vim.notify("Image not found: " .. full_path, vim.log.levels.WARN)
        end
      else
        vim.notify("No image reference found on current line", vim.log.levels.WARN)
      end
    end,
    desc = "Optimize image on line",
  },
  {
    "<leader>piF",
    function()
      -- Optimize all images referenced in current RST file
      local file = vim.fn.expand("%:p")
      local dir = vim.fn.expand("%:p:h")
      if not file:match("%.rst$") then
        vim.notify("Not an RST file", vim.log.levels.WARN)
        return
      end
      term_cmd("grep -oP '(?:image::|:file:)\\s*\\K[^\\s]+\\.png' " .. vim.fn.shellescape(file) ..
        " | while read img; do ./scripts/optimize_images.sh \"" .. dir .. "/$img\"; done")()
    end,
    desc = "Optimize all images in file",
  },
  -- Nix run variants (standalone)
  { "<leader>piD", term_cmd("nix run .#optimize-images-dry"), desc = "Dry run (nix)" },
  { "<leader>pio", term_cmd("nix run .#optimize-images"), desc = "Lossless (nix)" },
  { "<leader>piO", term_cmd("nix run .#optimize-images-lossy"), desc = "Lossy (nix)" },

  -- Benchmarking
  { "<leader>pB", group = "Benchmark" },
  { "<leader>pBq", term_cmd("./scripts/benchmark_build.sh --quick"), desc = "Quick benchmark" },
  { "<leader>pBs", term_cmd("./scripts/benchmark_build.sh --runs 3"), desc = "Standard benchmark (3 runs)" },
  { "<leader>pBf", term_cmd("./scripts/benchmark_build.sh --full --runs 3 --output build/benchmark_results.md"), desc = "Full benchmark (clean)" },
  {
    "<leader>pBr",
    function()
      vim.cmd("edit build/benchmark_results.md")
    end,
    desc = "View benchmark results",
  },

  -- Diagnostics / Errors
  { "<leader>pe", group = "Errors/Diagnostics" },
  { "<leader>peb", build_and_capture_errors("make fasthtml"), desc = "Build + capture errors" },
  { "<leader>peB", build_and_capture_errors("make html"), desc = "Build strict + capture errors" },
  { "<leader>per", rstcheck_to_quickfix, desc = "RST check to quickfix" },
  { "<leader>pea", function() parse_sphinx_errors() end, desc = "Parse last build log" },
  { "<leader>peo", "<cmd>copen<cr>", desc = "Open quickfix list" },
  { "<leader>pec", "<cmd>cclose<cr>", desc = "Close quickfix list" },
  { "<leader>pen", "<cmd>cnext<cr>", desc = "Next error" },
  { "<leader>pep", "<cmd>cprev<cr>", desc = "Previous error" },
  { "<leader>pef", "<cmd>cfirst<cr>", desc = "First error" },
  { "<leader>pel", "<cmd>clast<cr>", desc = "Last error" },
  {
    "<leader>peL",
    function()
      -- Run linkcheck and parse output
      vim.notify("Running linkcheck (this may take a while)...", vim.log.levels.INFO)
      vim.fn.jobstart("make linkcheck 2>&1 | tee build/linkcheck.log", {
        on_exit = function()
          vim.schedule(function()
            local file = io.open("build/linkcheck/output.txt", "r")
            if not file then
              vim.notify("No linkcheck output found", vim.log.levels.WARN)
              return
            end

            local qf_items = {}
            for line in file:lines() do
              -- Pattern: file.rst:123: [broken] url: message
              local filepath, lnum, status, url = line:match("([^:]+):(%d+):%s*%[(%w+)%]%s*(.+)")
              if filepath and status == "broken" then
                table.insert(qf_items, {
                  filename = filepath,
                  lnum = tonumber(lnum),
                  col = 1,
                  text = "Broken link: " .. url,
                  type = "E",
                })
              end
            end
            file:close()

            if #qf_items > 0 then
              vim.fn.setqflist(qf_items)
              vim.cmd("copen")
              vim.notify(string.format("Found %d broken links", #qf_items), vim.log.levels.WARN)
            else
              vim.notify("No broken links found!", vim.log.levels.INFO)
            end
          end)
        end,
      })
    end,
    desc = "Link check to quickfix",
  },

  -- Help/Info
  { "<leader>ph", group = "Help/Info" },
  { "<leader>phm", term_cmd("make help"), desc = "Makefile help" },
  {
    "<leader>phr",
    function()
      vim.cmd("edit README.md")
    end,
    desc = "Open README",
  },
  {
    "<leader>phc",
    function()
      vim.cmd("edit docs/documentation_guidelines/index.rst")
    end,
    desc = "Contribution guidelines",
  },
})

-- Treesitter configuration for RST if available
local ts_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if ts_ok then
  ts_configs.setup({
    ensure_installed = { "rst", "python", "bash", "yaml", "json", "markdown" },
    highlight = { enable = true },
  })
end

-- LSP configuration for Python (used in conf.py and doctests)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    -- pyright or pylsp configuration if available
    local lsp_ok, lspconfig = pcall(require, "lspconfig")
    if lsp_ok and lspconfig.pyright then
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })
    end
  end,
})

-- Set up RST-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rst",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.textwidth = 79
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 3
    vim.opt_local.shiftwidth = 3
    vim.opt_local.softtabstop = 3

    -- RST-specific mappings
    vim.keymap.set("n", "<localleader>h1", "yypVr=", { buffer = true, desc = "RST H1 underline" })
    vim.keymap.set("n", "<localleader>h2", "yypVr-", { buffer = true, desc = "RST H2 underline" })
    vim.keymap.set("n", "<localleader>h3", "yypVr^", { buffer = true, desc = "RST H3 underline" })
    vim.keymap.set("n", "<localleader>h4", "yypVr~", { buffer = true, desc = "RST H4 underline" })
  end,
})

-- Notify that project config is loaded
vim.notify("QGIS Documentation project config loaded. Use <leader>p for project menu.", vim.log.levels.INFO)

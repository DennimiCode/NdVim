return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
        max_concurrent_installers = 10,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "clangd", -- C & C++
          "csharp_ls", -- C#
          "gopls", -- Golang
          "ts_ls", -- JavaScript & TypeScript
          "html", -- HTML
          "cssls", -- CSS
          "somesass_ls", -- Sass
          "lemminx", -- XML
          "taplo", -- TOML
          "yamlls", -- YAML
          "jsonls", -- JSON
          "marksman", -- Markdown
          "sqls", -- SQL
          "bashls", -- Bash
          "powershell_es", -- PowerShell
          "dockerls", -- Docker
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      local mason_nulls = require("mason-null-ls")
      mason_nulls.setup({
        ensure_installed = {
          "stylua", -- Lua formatter
          "clang_format", -- C & C++ formatter
          "csharpier", -- C# formatter
          "sqlfmt", -- SQL formatter
          "hadolint", -- Dockerfile
          "cspell", -- Code Spell Checker
          "goimports", -- Organize imports for Golang
          "golines", -- Golang convert long strings to short
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nanotee/sqls.nvim",
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      { "folke/lazydev.nvim", opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      lspconfig.csharp_ls.setup({ capabilities = capabilities }) -- C#
      lspconfig.clangd.setup({ capabilities = capabilities }) -- C & C++
      lspconfig.gopls.setup({ capabilities = capabilities, settings = { gopls = { completeUnimported = true } } }) -- Golang
      lspconfig.ts_ls.setup({ capabilities = capabilities }) -- JavaScript & TypeScript
      lspconfig.bashls.setup({ capabilities = capabilities }) -- Bash
      lspconfig.dockerls.setup({ capabilities = capabilities }) -- Docker
      lspconfig.cssls.setup({ capabilities = capabilities }) -- CSS
      lspconfig.jsonls.setup({ capabilities = capabilities }) -- JSON
      lspconfig.yamlls.setup({ capabilities = capabilities }) -- YAML
      lspconfig.taplo.setup({ capabilities = capabilities }) -- TOML
      lspconfig.lemminx.setup({ capabilities = capabilities }) -- XML
      lspconfig.marksman.setup({ capabilities = capabilities }) -- Markdown

      if vim.fn.has("win32") then
        lspconfig.powershell_es.setup({
          capabilities = capabilities,
          filetypes = { "ps1", "psm1", "psd1" },
          bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
          settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
          init_options = {
            enableProfileLoading = false,
          },
        }) -- PowerShell
        lspconfig.html.setup({ cmd = { "vscode-html-language-server.cmd", "--stdio" }, capabilities = capabilities }) -- HTML
        lspconfig.lua_ls.setup({
          cmd = { "lua-language-server.cmd", "--stdio" },
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
          capabilities = capabilities,
        }) -- Lua
      else
        lspconfig.powershell_es.setup({ capabilities = capabilities }) -- PowerShell
        lspconfig.html.setup({ capabilities = capabilities }) -- HTML
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
          capabilities = capabilities,
        }) -- Lua
      end
    end,
  },
}

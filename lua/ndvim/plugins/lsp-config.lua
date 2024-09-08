return {
  {
    "williamboman/mason.nvim",
    config = function()
      local mason = require("mason")
      mason.setup({
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
      local masonlsp = require("mason-lspconfig")
      masonlsp.setup({
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
          "jdtls", -- Java
          "gradle_ls", -- Gradle
          "kotlin_language_server", -- Kotlin
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
          "google-java-format", -- Java formatter with Google rules
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
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    config = function() end,
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

      lspconfig.lua_ls.setup({ -- Lua
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
        capabilities = capabilities,
      })
      lspconfig.csharp_ls.setup({ capabilities = capabilities }) -- C#
      lspconfig.clangd.setup({ capabilities = capabilities }) -- C & C++
      lspconfig.gopls.setup({ -- Golang
        capabilities = capabilities,
        settings = {
          gopls = {
            completeUnimported = true,
          },
        },
      })
      lspconfig.tsserver.setup({ capabilities = capabilities }) -- JavaScript & TypeScript
      lspconfig.jdtls.setup({ capabilities = capabilities }) -- Java
      lspconfig.gradle_ls.setup({ capabilities = capabilities }) -- Gradle
      lspconfig.kotlin_language_server.setup({ capabilities = capabilities }) -- Kotlin
      lspconfig.bashls.setup({ capabilities = capabilities }) -- Bash
      lspconfig.powershell_es.setup({ capabilities = capabilities }) -- PowerShell
      lspconfig.dockerls.setup({ capabilities = capabilities }) -- Docker
      lspconfig.html.setup({ capabilities = capabilities }) -- HTML
      lspconfig.cssls.setup({ capabilities = capabilities }) -- CSS
      lspconfig.jsonls.setup({ capabilities = capabilities }) -- JSON
      lspconfig.yamlls.setup({ capabilities = capabilities }) -- YAML
      lspconfig.taplo.setup({ capabilities = capabilities }) -- TOML
      lspconfig.lemminx.setup({ capabilities = capabilities }) -- XML
      lspconfig.marksman.setup({ capabilities = capabilities }) -- Markdown
      lspconfig.sqls.setup({ -- SQL & DB connections
        on_attach = function(client, bufnr)
          require("sqls").on_attach(client, bufnr)
        end,
        settings = { sqls = { connections = require("ndvim.configs.sqls_connections") } },
        capabilities = capabilities,
      })
    end,
  },
}

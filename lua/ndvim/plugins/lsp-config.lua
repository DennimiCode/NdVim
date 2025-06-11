return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
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
          "dockerls", -- Docker
          "typos_lsp", -- Typos checker/fixer
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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      vim.lsp.config.csharp_ls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("csharp_ls")

      vim.lsp.config.clangd = {
        capabilities = capabilities,
      }
      vim.lsp.enable("clangd")

      vim.lsp.config.gopls = {
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            staticcheck = true,
            analyses = {
              unusedparams = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            semanticTokens = true,
          },
        },
      }
      vim.lsp.enable("gopls")

      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("ts_ls")

      vim.lsp.config.bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "bash", "sh" },
        capabilities = capabilities,
      }
      vim.lsp.enable("bashls")

      vim.lsp.config.dockerls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("dockerls")

      vim.lsp.config.cssls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("cssls")

      vim.lsp.config.jsonls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("jsonls")

      vim.lsp.config.yamlls = {
        capabilities = capabilities,
      }
      vim.lsp.enable("yamlls")

      vim.lsp.config.taplo = {
        capabilities = capabilities,
      }
      vim.lsp.enable("taplo")

      vim.lsp.config.lemminx = {
        capabilities = capabilities,
      }
      vim.lsp.enable("lemminx")

      vim.lsp.config.marksman = {
        capabilities = capabilities,
      }
      vim.lsp.enable("marksman")

      vim.lsp.config.html = {
        capabilities = capabilities,
      }
      vim.lsp.enable("html")

      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      }
      vim.lsp.enable("lua_ls")
    end,
  },
}

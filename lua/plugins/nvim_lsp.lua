local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
lspconfig.clangd.setup({ capabilities = capabilities })    -- C & C++
lspconfig.gopls.setup({                                    -- Golang
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
    },
  },
})
lspconfig.tsserver.setup({ capabilities = capabilities })               -- JavaScript & TypeScript
lspconfig.jdtls.setup({ capabilities = capabilities })                  -- Java
lspconfig.gradle_ls.setup({ capabilities = capabilities })              -- Gradle
lspconfig.kotlin_language_server.setup({ capabilities = capabilities }) -- Kotlin
lspconfig.bashls.setup({ capabilities = capabilities })                 -- Bash
lspconfig.powershell_es.setup({ capabilities = capabilities })          -- PowerShell
lspconfig.dockerls.setup({ capabilities = capabilities })               -- Docker
lspconfig.html.setup({ capabilities = capabilities })                   -- HTML
lspconfig.cssls.setup({ capabilities = capabilities })                  -- CSS
lspconfig.jsonls.setup({ capabilities = capabilities })                 -- JSON
lspconfig.yamlls.setup({ capabilities = capabilities })                 -- YAML
lspconfig.taplo.setup({ capabilities = capabilities })                  -- TOML
lspconfig.lemminx.setup({ capabilities = capabilities })                -- XML
lspconfig.marksman.setup({ capabilities = capabilities })               -- Markdown
lspconfig.sqls.setup({                                                  -- SQL & DB connections
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
  settings = { sqls = { connections = require("plugins.sqls_connections") } },
  capabilities = capabilities,
})

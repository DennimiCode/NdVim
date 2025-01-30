return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "davidmh/cspell.nvim",
  },
  config = function()
    local cspell = require("cspell")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.formatting_sync()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.diagnostics.codespell,
        cspell.diagnostics.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["HINT"]
          end,
        }),
        cspell.code_actions,
        null_ls.builtins.formatting.prettierd,    -- Prettier (js, ts, jsx, tsx)
        null_ls.builtins.formatting.stylua,       -- Lua
        null_ls.builtins.formatting.clang_format, -- C & C++, Objective-C and etc. in CLang
        null_ls.builtins.formatting.gofmt,        -- Golang
        null_ls.builtins.formatting.goimports,    -- Golang auto import
        null_ls.builtins.diagnostics.hadolint,    -- Dockerfile
        null_ls.builtins.formatting.sqlfmt,       -- SQL formatter
        null_ls.builtins.formatting.csharpier,    -- C# formatter
      },
    })
  end,
}

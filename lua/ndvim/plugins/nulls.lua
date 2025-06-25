--[[
    This file is part of NdVim – yet another Neovim config called Neodymium.
    Copyright (C) 2024-2025  Denis Denisov (@DennimiCode)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

return {
  "nvimtools/none-ls.nvim",
  config = function()
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
        null_ls.builtins.formatting.goimports.with({
          extra_args = { "-local", "github.com/DennimiCode/,gitlab.services.mts.ru/" },
        }),
        null_ls.builtins.formatting.gofmt, -- Golang
        null_ls.builtins.formatting.prettierd, -- Prettier (js, ts, jsx, tsx)
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.clang_format, -- C & C++, Objective-C and etc. in CLang
        null_ls.builtins.diagnostics.hadolint, -- Dockerfile
        null_ls.builtins.formatting.sqlfmt, -- SQL formatter
        null_ls.builtins.formatting.csharpier, -- C# formatter
      },
    })
  end,
}

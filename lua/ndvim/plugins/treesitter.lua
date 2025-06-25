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
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "OXY2DEV/markview.nvim",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ignore_install = {},
      modules = {},
      ensure_installed = {
        "printf",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "tmux",
        "query",
        "regex",
        "c",
        "cpp",
        "c_sharp",
        "go",
        "gomod",
        "markdown",
        "markdown_inline",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "sql",
        "bash",
        "http",
        "proto",
        "dockerfile",
        "toml",
        "yaml",
        "xml",
        "json",
        "json5",
        "jsonc",
        "hjson",
        "jsonnet",
        "gitignore",
        "editorconfig",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}

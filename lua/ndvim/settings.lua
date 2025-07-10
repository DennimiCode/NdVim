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

local opt = vim.opt
local o = vim.o
local g = vim.g
local wo = vim.wo
local vapi = vim.api

-- The builtin file type detection provided by nvim.
g.did_load_filetypes = 1
-- Always enable status line.
o.laststatus = 3
-- Disable show mode.
o.showmode = false
-- Set update time to 100 ms.
opt.updatetime = 100
-- When signs are defined for a file, Vim will automatically add a column of two
-- characters to display them in.  When the last sign is unplaced the column disappears again.
wo.signcolumn = "yes"
-- Faster scroll.
opt.scrolloff = 8
-- Disable wrapping.
opt.wrap = false
-- Enable line breaking.
wo.linebreak = true
-- Virtual editing means that the cursor can be positioned where there is
-- no actual character.  This can be halfway into a tab or beyond the end of the line.
opt.virtualedit = "block"
-- Enable undo file.
opt.undofile = true
-- Disable swap file.
opt.swapfile = false
-- Set default buffer encoding as UTF-8.
opt.encoding = "utf-8"
-- Enable 24 bit colors in terminal.
opt.termguicolors = true
g.syntax = "on"
-- Enable color column on 120 length.
opt.colorcolumn = "120"
-- Highlight the text line of the cursor with Cursor line.
o.cursorline = true
-- Defines how Cursor line will be displayed.
o.cursorlineopt = "both"
-- Search & autocomplete options.
o.ignorecase = true
o.smartcase = true
opt.completeopt = { "menu", "menuone", "noselect" }
-- Setup color column color.
vim.cmd("hi colorcolumn guibg=#F4935B")
-- Setup session options
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- Enable Nerd Font in Dadbod UI
g.db_ui_use_nerd_fonts = 1

-- Enable spell checker
opt.spell = true
opt.spelllang = { "en", "ru" }

-- Enable mouse.
opt.mouse = "a"
opt.mousefocus = true

-- Sync clipboard with OS.
opt.clipboard = "unnamedplus"

-- Setup line numbers.
opt.number = true
opt.relativenumber = true
o.number = true
o.numberwidth = 2
wo.relativenumber = true

-- Default indent Settings.
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Setup indent exceptions.
-- Python indent setup.
vapi.nvim_create_autocmd("FileType", {
  pattern = "py",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.colorcolumn = "80"
  end,
})

-- GO indent setup.
vapi.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- C# Lang indent setup.
vapi.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Add binaries installed by mason.nvim to path.
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, "/") .. ":" .. vim.env.PATH

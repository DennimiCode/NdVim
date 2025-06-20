local opt = vim.opt
local o = vim.o
local g = vim.g
local wo = vim.wo
local vapi = vim.api

-- The builtin filetype detection provided by Nvim.
g.did_load_filetypes = 1
-- Always enable statusline.
o.laststatus = 3
-- Disable showmode.
o.showmode = false
-- Set updatetime to 100 ms.
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
-- Highlight the text line of the cursor with CursorLine.
o.cursorline = true
-- Defines how CursorLine will be displayed.
o.cursorlineopt = "both"
-- Search & autocompleate options.
o.ignorecase = true
o.smartcase = true
opt.completeopt = { "menu", "menuone", "noselect" }
-- Setup colorcolumn color.
vim.cmd("hi colorcolumn guibg=#F4935B")
-- Setup session options
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- Enable NerdFont in Dadbod UI
g.db_ui_use_nerd_fonts = 1

-- Enable spell checker
opt.spell = true
opt.spelllang = "en_us,en_gb,ru_ru"

-- Select shell type based on your OS (For windows: PowerShell NEW, for other: your default shell).
if vim.fn.has("win32") == true then
  vim.cmd([[
    set shell=pwsh
    set shellcmdflag=-command
    set shellquote=\"
    set shellxquote=
]])
else
  o.shell = o.shell
end

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
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

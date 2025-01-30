local map = vim.keymap.set
-- Set space as <leader> key.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Main keymaps
-- Save changes in current buffer.
map("n", "<leader>w", ":w<CR>", { silent = true })
-- Save changes in all opened buffers.
map("n", "<leader>wa", ":wa<CR>", { silent = true })
-- Save changes in all opened buffers and close neovim.
map("n", "<leader>wqa", ":wqa<CR>", { silent = true })
-- Save changes in current buffer and close it.
map("n", "<leader>wq", ":wq<CR>", { silent = true })
-- Close current buffer.
map("n", "<leader>q", ":q<CR>", { silent = true })
-- Fast exit from INSERT mode by pressing jj.
map("i", "jj", "<ESC>", { silent = true })
-- Clear highlighting after search.
map("n", "<leader>h", ":nohlsearch<CR>", { silent = true })

-- Cursor navigation on hjkl in insert mode.
map("i", "<C-k>", "<Up>", { silent = true })
map("i", "<C-j>", "<Down>", { silent = true })
map("i", "<C-h>", "<Left>", { silent = true })
map("i", "<C-l>", "<Right>", { silent = true })

-- Window navigation on hjkl.
map("n", "<C-k>", ":wincmd k<CR>", { silent = true })
map("n", "<C-j>", ":wincmd j<CR>", { silent = true })
map("n", "<C-h>", ":wincmd h<CR>", { silent = true })
map("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- Resize panes on hjkl
vim.keymap.set("n", "<C-M-L>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-M-H>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-M-K>", ":horizontal resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-M-J>", ":horizontal resize -2<CR>", { silent = true })

-- Buffer splits keymap.
map("n", "|", ":vsplit<CR>", { silent = true })
map("n", "\\", ":split<CR>", { silent = true })

-- LSP
map("n", "[d", vim.diagnostic.goto_prev, { silent = true })
map("n", "]d", vim.diagnostic.goto_next, { silent = true })
map("n", "<leader>lD", vim.diagnostic.open_float, { silent = true })
map("n", "<leader>ll", vim.diagnostic.setloclist, { silent = true })
map("n", "<leader>la", vim.lsp.buf.code_action, { silent = true })
map("n", "<leader>lf", vim.lsp.buf.format, { silent = true })
map("n", "<leader>lk", vim.lsp.buf.hover, { silent = true })
map("n", "<leader>ld", vim.lsp.buf.definition, { silent = true })
map("n", "<leader>li", vim.lsp.buf.implementation, { silent = true })
map("n", "<F2>", vim.lsp.buf.rename, { silent = true })

-- Debugging
map("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { silent = true })
map("n", "<leader>dx", ":DapTerminate<CR>", { silent = true })
map("n", "<leader>do", ":DapStepOver<CR>", { silent = true })
map("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", { silent = true })
map("n", "<leader>dc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>lp", "lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<S-F5>", ":lua require'dap'.close()<CR>")
map("n", "<C-S-F5>", ":lua require'dap'.restart()<CR>")
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })

-- Auto-Session
map("n", "<leader>R", ":SessionRestore<CR>", { silent = true })

-- NeoTree
map("n", "<leader>e", ":Neotree toggle float focus<CR>", { silent = true })
map("n", "<leader>E", ":Neotree toggle float reveal<CR>", { silent = true })

-- Bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<M-l>", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "<M-h>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<leader>x", ":BufferLinePickClose<CR>", { silent = true })
map("n", "<leader>X", ":BufferLineCloseOthers<CR>", { silent = true })
map("n", "<leader>bs", ":BufferLineSortByTabs<CR>", { silent = true })
map("n", "<leader>bp", ":BufferLineTogglePin<CR>", { silent = true })
map("n", "<leader>bs", ":BufferLineSortByTabs<CR>", { silent = true })
map("n", "<leader>bo", function()
  local buf = vim.fn.input("Enter number/name of buffer: ")
  vim.cmd(":BufferLineGoToBuffer " .. buf)
end, { silent = true })

-- Trouble
map("n", "<leader>tx", function()
  require("trouble").toggle()
end, { silent = true })
map("n", "<leader>tw", function()
  require("trouble").toggle("workspace_diagnostics")
end, { silent = true })
map("n", "<leader>td", function()
  require("trouble").toggle("document_diagnostics")
end, { silent = true })
map("n", "<leader>tq", function()
  require("trouble").toggle("quickfix")
end, { silent = true })
map("n", "<leader>tl", function()
  require("trouble").toggle("loclist")
end, { silent = true })

-- Git
map("n", "<leader>gd", ":DiffviewOpen<CR>", { silent = true })
map("n", "<leader>gf", ":DiffviewClose<CR>", { silent = true })
map("n", "<leader>gs", ":Neotree toggle float git_status<CR>", { silent = true })

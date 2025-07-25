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
  "folke/which-key.nvim",
  dependencies = { { "echasnovski/mini.icons", version = false } },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<C-S-F5>", desc = "Restart debugging" },
      { "<C-h>", desc = "Switch to left window" },
      { "<C-j>", desc = "Switch to bottom window" },
      { "<C-k>", desc = "Switch to top window" },
      { "<C-l>", desc = "Switch to right window" },
      { "<F10>", desc = "Step over" },
      { "<F11>", desc = "Step into" },
      { "<F12>", desc = "Step out" },
      { "<F2>", desc = "Rename" },
      { "<F5>", desc = "Start/Continue debugging" },
      { "<F6>", desc = "Open compiler" },
      { "<S-F5>", desc = "Stop debugging" },
      { "<S-F6>", desc = "Rerun compiler" },
      { "<S-F7>", desc = "Toggle compiler results" },
      { "<S-Tab>", desc = "Switch to previous buffer" },
      { "<S-s>", desc = "Surround selected text" },
      { "<Tab>", desc = "Switch to next buffer" },
      { "<leader>/", desc = "Comment/uncomment Line" },
      { "<leader>?", desc = "Comment/uncomment block" },
      { "<leader>E", desc = "Float reveal file manager" },
      { "<leader>X", desc = "Close right Buffers" },
      { "<leader>c", group = "Comment" },
      { "<leader>cl", desc = "Comment/uncomment Line" },
      { "<leader>d", group = "Debugging" },
      { "<leader>dc", desc = "Set conditional breakpoint" },
      { "<leader>dl", desc = "Run last" },
      { "<leader>do", desc = "Step over" },
      { "<leader>dp", desc = "Set log breakpoint" },
      { "<leader>dt", desc = "Set breakpoint" },
      { "<leader>dx", desc = "Terminate debugging" },
      { "<leader>e", desc = "Float file manager" },
      { "<leader>f", group = "Find" },
      { "<leader>fb", desc = "Find Buffer" },
      { "<leader>ff", desc = "Find File" },
      { "<leader>fh", desc = "Find Help" },
      { "<leader>fw", desc = "Find Text" },
      { "<leader>g", group = "Git" },
      { "<leader>gb", desc = "Branches" },
      { "<leader>gc", desc = "Commits" },
      { "<leader>gd", desc = "Open Diffview" },
      { "<leader>gf", desc = "Close Diffview" },
      { "<leader>gs", desc = "Status" },
      { "<leader>h", desc = "No highlight" },
      { "<leader>l", group = "LSP" },
      { "<leader>lD", desc = "Hover diagnostic" },
      { "<leader>la", desc = "Code actions" },
      { "<leader>ld", desc = "Go to definition" },
      { "<leader>lf", desc = "Format file" },
      { "<leader>lk", desc = "Hover documentation" },
      { "<leader>ll", desc = "Set loclist" },
      { "<leader>p", group = "Live Previewer" },
      { "<leader>ps", desc = "Start Live Previewer" },
      { "<leader>pc", desc = "Close (stop) Live Previewer" },
      { "<leader>q", desc = "Quit" },
      { "<leader>s", desc = "Sort BufferLine tabs" },
      { "<leader>t", group = "Trouble" },
      { "<leader>td", desc = "Toggle trouble document diagnostics" },
      { "<leader>tl", desc = "Toggle trouble loclist" },
      { "<leader>tq", desc = "Toggle trouble quickfix" },
      { "<leader>tw", desc = "Toggle trouble workspace diagnostics" },
      { "<leader>tx", desc = "Toggle trouble" },
      { "<leader>w", desc = "Save" },
      { "<leader>wa", desc = "Save all" },
      { "<leader>x", desc = "Close Buffer" },
      { "\\", desc = "Horizontal split" },
      { "|", desc = "Vertical split" },
    })
  end,
}

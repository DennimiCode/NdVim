return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard_arts = require("ndvim.configs.dashboard_arts")
    local dashboard = require("dashboard")
    dashboard.setup({
      theme = "doom",
      config = {
        header = dashboard_arts.ansi_shadow_neodymium,
        center = {
          {
            icon = "󰙅 ",
            icon_hl = "Title",
            desc = "Open tree",
            desc_hl = "String",
            key = "e",
            keymap = "SPC e",
            key_hl = "Number",
            action = ":Neotree float",
          },
          {
            icon = "󰈞 ",
            icon_hl = "Title",
            desc = "Find files",
            desc_hl = "String",
            key = "f",
            keymap = "SPC f f",
            key_hl = "Number",
            action = ":Telescope find_files",
          },
          {
            icon = " ",
            icon_hl = "Title",
            desc = "Find text",
            desc_hl = "String",
            key = "w",
            keymap = "SPC f w",
            key_hl = "Number",
            action = ":Telescope live_grep",
          },
          {
            icon = " ",
            icon_hl = "Title",
            desc = "Git Braches",
            desc_hl = "String",
            key = "b",
            keymap = "SPC g b",
            key_hl = "Number",
            action = ":Telescope git_branches",
          },
        },
      },
    })
  end
}

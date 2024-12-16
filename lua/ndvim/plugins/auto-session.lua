return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_restore_enabled = false,
    })
  end,
}

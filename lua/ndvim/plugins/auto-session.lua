return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local auto_session = require("auto-session")
    auto_session.setup({
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_restore_enabled = false,
    })
  end
}

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    {
      "roobert/surround-ui.nvim",
      dependencies = {
        "folke/which-key.nvim",
      },
    }
  },
  config = function()
    local surround = require("nvim-surround")
    local surround_ui = require("surround-ui")
    surround.setup({})
    surround_ui.setup({
      root_key = "S",
    })
  end
}

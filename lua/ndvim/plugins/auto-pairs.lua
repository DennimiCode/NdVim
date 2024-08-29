return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local nautopairs = require("nvim-autopairs")
    nautopairs.setup({})
  end,
}

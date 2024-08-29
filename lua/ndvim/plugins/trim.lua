return {
  "cappyzawa/trim.nvim",
  config = function()
    local trim = require("trim")
    trim.setup({
      ft_blocklist = { "markdown" },
      trim_last_line = false,
    })
  end
}

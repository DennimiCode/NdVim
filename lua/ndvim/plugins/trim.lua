return {
  "cappyzawa/trim.nvim",
  config = function()
    require("trim").setup({
      ft_blocklist = { "markdown" },
      trim_last_line = false,
    })
  end,
}

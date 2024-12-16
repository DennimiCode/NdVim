return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      mappings = {
        i = {
          j = {
            j = "<Esc>",
          },
        },
      },
      timeout = vim.o.timeoutlen,
    })
  end,
}

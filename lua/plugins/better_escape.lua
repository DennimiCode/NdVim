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

return {
  "max397574/better-escape.nvim",
  config = function()
    local better_escape = require("better_escape")
    better_escape.setup({
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

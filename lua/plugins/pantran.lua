require("pantran").setup({
  default_engine = "yandex",
  engines = {
    yandex = {
      default_source = "auto",
      default_target = "RU-RU",
    },
    google = {
      default_source = "auto",
      default_target = "ru",
    },
    deepl = {
      default_source = "auto",
      default_target = "RU-RU",
    },
  },
})

vim.keymap.set("n", "<leader>tr", require("pantran").motion_translate, { noremap = true, silent = true, expr = true })
vim.keymap.set("n", "<leader>trr", function()
  return require("pantran").motion_translate() .. "_"
end, { noremap = true, silent = true, expr = true })
vim.keymap.set("x", "<leader>tr", require("pantran").motion_translate, { noremap = true, silent = true, expr = true })

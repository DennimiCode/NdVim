return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        devicon = true,
        title = true,
        code_action = "󰌵",
        imp_sign = "",
        actionfix = "",
        expand = "",
        collapse = "",
      },
      beacon = { enable = true },
      symbol_in_winbar = { enable = true },
      implement = { enable = true },
    })
  end,
}

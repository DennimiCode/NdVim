return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  build = ":TSUpdate",
  config = function()
    local ts_config = require("nvim-treesitter.configs")
    ts_config.setup({
      ensure_installed = {
        "printf",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "tmux",
        "query",
        "c",
        "cpp",
        "c_sharp",
        "go",
        "gomod",
        "java",
        "groovy",
        "kotlin",
        "markdown",
        "markdown_inline",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "sql",
        "bash",
        "http",
        "dockerfile",
        "toml",
        "yaml",
        "xml",
        "json",
        "json5",
        "jsonc",
        "hjson",
        "jsonnet",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}

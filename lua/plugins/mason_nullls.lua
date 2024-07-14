require("mason-null-ls").setup({
  ensure_installed = {
    "stylua",             -- Lua formatter
    "clang_format",       -- C & C++ formatter
    "csharpier",          -- C# formatter
    "google-java-format", -- Java formatter with Google rules
    "sqlfmt",             -- SQL formatter
    "hadolint",           -- Dockerfile
    "cspell",             -- Code Spell Checker
    "goimports",          -- Organize imports for Golang
    "golines",            -- Golang convert long strings to short
  },
  automatic_installation = true,
})

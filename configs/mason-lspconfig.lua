require("mason-lspconfig").setup {
  ensure_installed = {
    "rust_analyzer",

    -- Python --
    "pyright",
    "debugpy",
    "mypy",
    "ruff",
    "black",
    "isort",

    -- General Formatting --
    "prettier",
    "prettierd",

    -- Lua Formatting --
    "stylua",

    -- Frontend --
    "typescript-language-server",
    "tailwindcss-language-server",
    "css-lsp",
    "html-lsp",
    "eslint-lsp",
    "js-debug-adapter",
  },
  automatic_installation = true,
}

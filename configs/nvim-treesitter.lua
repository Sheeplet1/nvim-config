require("nvim-treesitter").setup {
  opts = {
    ensure_installed = {
      "python",
      "html",
      "javascript",
      "css",
      "vim",
      "tsx",
      "typescript",
      "vue",
      "json",
      "lua",
    },
  },
}

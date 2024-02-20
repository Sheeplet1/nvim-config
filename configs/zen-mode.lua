require("zen-mode").setup {
  window = {
    width = 150,
    height = 1,
    backdrop = 0.93,
  },
  plugins = {
    options = {
      showcmd = true, -- disables the command in the last line of the screen
    },

    tmux = {
      enabled = true,
    },

    gitsigns = { enabled = true }, -- disables git signs
  },
}

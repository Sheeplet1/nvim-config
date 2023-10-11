local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>d"] = { '<cmd> "_d', "Delete without yanking" },
    ["<leader>p"] = { '<cmd> "_dp', "Replace without yank" },
    ["C-f"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Silently open new tmux session" },
    ["<leader>gg"] = { ":LazyGit<CR>", "Open LazyGit interface" },
    ["<leader>cb"] = {
      ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.",
      "Create centered comment header block",
    },
    ["<leader>cl"] = { ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>", "Create centered comment header line" },
    ["<leader>md"] = { ":MarkdownPreview<CR>", "Start MarkdownPreview" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

return M

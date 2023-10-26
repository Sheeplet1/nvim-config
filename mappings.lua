local M = {}

M.general = {
  n = {
    -- TMUX --
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    -- ["C-f"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Silently open new tmux session" },

    -- PLUGINS --
    ["<leader>gg"] = { ":LazyGit<CR>", "Open LazyGit interface" },
    ["<leader>zm"] = { ":ZenMode<CR>", "Start ZenMode" },
    ["<leader>md"] = { ":MarkdownPreview<CR>", "Start MarkdownPreview" },
    ["<leader>tt"] = { ":TodoTrouble<CR>", "Execute TodoTrouble" },

    -- QOL --
    ["<leader>d"] = { '<cmd> "_d', "Delete without yanking" },
    ["<leader>p"] = { '<cmd> "_dp', "Replace without yank" },
    ["<leader>cb"] = {
      ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.",
      "Create centered comment header block",
    },
    ["<leader>cl"] = { ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>", "Create centered comment header line" },
    ["<C-d>"] = { "<C-d>zz", "Centre screen while half page jumping" },
    ["<C-u>"] = { "<C-u>zz", "Centre screen while half page jumping" },
    ["n"] = { "nzzzv", "Search terms stay centred" },
    ["N"] = { "Nzzzv", "Search terms stay centred" },
    ["<leader>y"] = { '"+y', "Yank into system clipboard" },
    ["gb"] = { "<C-o>", "Jump back after going to definition" },
    ["gd"] = { "gdzz", "Centre on go to definition" },
    ["<S-}>"] = { "<S-}>zzzv" },
    ["<S-{>"] = { "<S-{>zzzv" },
    ["<leader>w"] = { ":w<CR>", "Save file" },
    ["<leader>wq"] = { ":wq<CR>", "Save file and quit" },
    ["<leader>q"] = { ":q!<CR>", "Quit file without saving" },
    ["Y"] = { "y$", "Yank till end of line" },
    ["D"] = { "d$", "Delete till end of line" },
    ["C"] = { "c$", "Change till end of line" },
    ["S"] = { "0", "Go to start of line" },
    ["E"] = { "$", "Go to end of line" },
  },

  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move highlighted block down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move highlighted block up" },
    ["<leader>y"] = { '"+y', "Yank into system clipboard" },
    ["<leader>d"] = { '<cmd> "_d', "Delete without yanking" },
  },

  i = {},
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

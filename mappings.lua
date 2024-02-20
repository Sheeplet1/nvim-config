local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
  },
}

M.general = {
  n = {
    -- QOL --
    ["<leader>d"] = { '<cmd> "_d', "Delete without yanking" },
    ["<leader>p"] = { '<cmd> "_dp', "Replace without yank" },
    ["<C-d>"] = { "<C-d>zz", "Centre screen while half page jumping" },
    ["<C-u>"] = { "<C-u>zz", "Centre screen while half page jumping" },
    ["n"] = { "nzzzv", "Search terms stay centred" },
    ["N"] = { "Nzzzv", "Search terms stay centred" },
    ["<leader>y"] = { '"+y', "Yank into system clipboard" },
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
}

M.comments = {
  n = {
    ["<leader>cb"] = {
      ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.",
      "Create centered comment header block",
    },
    ["<leader>cl"] = { ":center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>", "Create centered comment header line" },
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

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.tmux_navigator = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    -- ["C-f"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Silently open new tmux session" },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit<CR>", "[lazygit] Open UI" },
  },
}

M.zenmode = {
  n = {
    ["<leader>zm"] = { "<cmd> ZenMode<CR>", "[zenmode] Toggle" },
  },
}

M.markdownpreview = {
  n = {
    ["<leader>md"] = { "<cmd> MarkdownPreview<CR>", "[markdownpreview] Start UI" },
  },
}

M.todotrouble = {
  n = {
    ["<leader>tt"] = { "<cmd> TodoTrouble<CR>", "[todotrouble] Start UI" },
  },
}

M.shade = {
  n = {
    ["<Bslash>"] = {
      function()
        require("shade").toggle()
      end,

      "[shade] Toggle shade.nvim",
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>h"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "[harpoon] Toggle UI",
    },
    -- ["<leader>h"] = { "<cmd>Telescope harpoon marks<cr>", "[harpoon] Toggle UI" },
    ["<leader>ha"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      "[harpoon] Add file",
    },

    ["<leader>1"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(1)
      end,
      "[harpoon] Navigate to file 1",
    },
    ["<leader>2"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(2)
      end,
      "[harpoon] Navigate to file 2",
    },
    ["<leader>3"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(3)
      end,
      "[harpoon] Navigate to file 3",
    },
    ["<leader>4"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(4)
      end,
      "[harpoon] Navigate to file 4",
    },
    ["<leader>5"] = {
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(5)
      end,
      "[harpoon] Navigate to file 5",
    },

    ["<leader>hn"] = { "<cmd>lua require('harpoon'):list():next()<cr>", "[harpoon] Next file" },
    ["<leader>hN"] = { "<cmd>lua require('harpoon'):list():prev()<cr>", "[harpoon] Prev file" },
  },
}

M.undotree = {
  n = {
    ["<leader>ut"] = {
      "<cmd> UndotreeToggle<CR>",
      "Open Undo Tree",
    },
  },
}

return M

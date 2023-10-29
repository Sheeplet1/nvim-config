local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
      require "custom.configs.dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    ensure_installed = {
      -- NOTE: It is in mason-lspconfig.lua
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      -- FIX: Not sure if this is working
      require "custom.configs.mason-lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
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
    dependencies = {
      { "windwp/nvim-ts-autotag", opts = {} },
    },
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "glepnir/lspsaga.nvim",
    opts = {
      branch = "main",
    },
    config = function()
      require("lspsaga").setup {}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    build = "cd app && npm install",
    opts = {},
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    config = function()
      require "custom.configs.zen-mode"
    end,
  },
  {
    "folke/twilight.nvim",
    lazy = false,
    dependencies = {
      "folke/zen-mode.nvim",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
      }
      vim.cmd [[highlight IndentBlanklineContextChar guifg=#cba6f7 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineContextStart guisp=#cba6f7 gui=underline]]
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins

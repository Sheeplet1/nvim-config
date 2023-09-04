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
    opts = {
      ensure_installed = {
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
        "emmet-ls",
        "eslint-lsp",
        "eslint_d",
        "js-debug-adapter",
      },
    },
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
    "jcdickinson/codeium.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
return plugins

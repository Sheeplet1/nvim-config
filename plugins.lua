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
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = "python",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --   },
  --   config = function()
  --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(path)
  --     require("core.utils").load_mappings "dap"
  --   end,
  -- },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
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
        "pyright",
        "debugpy",
        "mypy",
        "ruff",
        "black",
        "isort",
        "rust-analyzer",

        -- Formatting --
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
      require "custom.configs.mason-lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
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
        "rust",
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
  },
  {
    "nvimdev/lspsaga.nvim",
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
  -- {
  --   "folke/zen-mode.nvim",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.zen-mode"
  --   end,
  -- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  --   config = function()
  --     require("indent_blankline").setup {
  --       show_current_context = true,
  --       show_current_context_start = true,
  --       show_end_of_line = true,
  --     }
  --     vim.cmd [[highlight IndentBlanklineContextChar guifg=#cba6f7 gui=nocombine]]
  --     vim.cmd [[highlight IndentBlanklineContextStart guisp=#cba6f7 gui=underline]]
  --   end,
  -- },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
      require("core.utils").load_mappings "crates"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "custom.configs.lsp_signature"
    end,
  },
  {
    "ErichDonGubler/lsp_lines.nvim",
    lazy = false,
    config = function()
      require("lsp_lines").setup {}
    end,
  },
}

return plugins

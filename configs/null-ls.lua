local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- CODE FOR CHOOSING BETWEEN ESLINT OR PRETTIER FORMATTING --
local root_has_file = function(files)
  return function(utils)
    return utils.root_has_file(files)
  end
end

local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }

-- Swapping between eslint and prettier formatting if given the files
local check_formatting = {
  eslint_formatting = {
    condition = function(utils)
      local has_eslint = root_has_file(eslint_root_files)(utils)
      local has_prettier = root_has_file(prettier_root_files)(utils)
      return has_eslint and not has_prettier
    end,
  },

  prettier_formatting = {
    -- condition = root_has_file(prettier_root_files),
    condition = function(utils)
      local has_eslint = root_has_file(eslint_root_files)(utils)
      local has_prettier = root_has_file(prettier_root_files)(utils)
      return (not has_eslint and not has_prettier) or has_prettier
    end,
  },
}

local opts = {

  sources = {
    -- Frontend
    formatting.prettierd.with {
      check_formatting.prettier_formatting,
    },

    -- Lua
    formatting.stylua,

    -- Python
    diagnostics.mypy,
    diagnostics.ruff,
    formatting.isort.with {
      filetypes = {
        "python",
      },
    },
    formatting.black.with {
      filetypes = {
        "python",
      },
    },

    -- Github --
    code_actions.gitsigns,
  },

  -- Autoformat on save --
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts

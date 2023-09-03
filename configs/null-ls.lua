local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local opts = {
  sources = {
    -- Frontend
    formatting.prettierd.with {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "html",
      "json",
      "markdown",
    },
    diagnostics.eslint,
    code_actions.eslint,

    -- Lua
    formatting.stylua,

    -- Python
    diagnostics.mypy,
    diagnostics.ruff,
    formatting.isort,
    formatting.black,
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

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  -- PYTHON --
  "pyright",

  -- FRONTEND --
  "emmet_ls",
  "html",
  "cssls",
  "tsserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Organise Imports --
local function organise_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- FRONTEND --
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    separate_diagnostic_server = true,
    public_diagnostic_on = "insert_leave",
    tsserver_plugins = {},
  },
  commands = {
    OrganiseImports = {
      organise_imports,
      description = "Organise Imports",
    },
  },
}

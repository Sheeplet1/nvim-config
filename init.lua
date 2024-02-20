vim.opt.colorcolumn = "80"
vim.wo.relativenumber = true
vim.o.cmdheight = 1

-- resize nvimtree if window got resized
function NvimTree_width_ratio(percentage)
  local ratio = percentage / 100
  local width = math.floor(vim.go.columns * ratio)
  return width
end

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local width = NvimTree_width_ratio(20)
    vim.cmd("tabdo NvimTreeResize " .. width)
  end,
})

-- Highlight yanked group
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
--   end,
-- })

-- vim.diagnostic.config {
--   virtual_text = false,
-- }

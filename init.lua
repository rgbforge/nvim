vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


require("config.plugins")

vim.o.background = 'dark'
local vs_status_ok, vscode = pcall(require, "vscode")
if vs_status_ok then
  local c = require('vscode.colors').get_colors()
  require('vscode').setup({
    transparent = true,
    italic_comments = true,
    underline_links = true,
    disable_nvimtree_bg = true,
    terminal_colors = true,
    color_overrides = { vscLineNumber = '#FFFFFF' },
    group_overrides = {
      Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    }
  })
  vim.cmd.colorscheme "vscode"
else
  vim.notify("vscode color error", vim.log.levels.WARN)
end

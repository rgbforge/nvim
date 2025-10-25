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

vim.pack.add({
  {src = 'nvim-tree/nvim-web-devicons', lazy = true },
  {src = 'catppuccin/nvim', name = "catppuccin", priority = 1000 },
  {src = 'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },
  {src = 'Mofiqul/vscode.nvim' },
  {src = 'ThePrimeagen/vim-be-good', cmd = "VimBeGood" },
})

vim.o.background = 'dark'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    transparent = true,
    italic_comments = true,
    underline_links = true,
    disable_nvimtree_bg = true,
    terminal_colors = true,
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

vim.cmd.colorscheme "vscode"
--vim.cmd.colorscheme "catppuccin"
--vim.cmd[[colorscheme tokyonight-storm]]
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ruff')

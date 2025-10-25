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

{src = 'https://github.com/nvim-tree/nvim-web-devicons', lazy = true },
  {src = 'https://github.com/catppuccin/nvim', name = "catppuccin", priority = 1000 },
  {src = 'https://github.com/folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },
  {src = 'https://github.com/Mofiqul/vscode.nvim' },
  {src = 'https://github.com/ThePrimeagen/vim-be-good', cmd = "VimBeGood" },
  {src = 'https://github.com/nvim-lua/plenary.nvim'},
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = '0.1.8',
  },
  {
   src = 'https://github.com/NeogitOrg/neogit',
  },
  {
   src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "cpp", "lua", "python" },
      highlight = { enable = true },
    },
  },
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

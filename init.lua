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
  {src = 'https://github.com/Mofiqul/vscode.nvim' },
  {src = 'https://github.com/nvim-lua/plenary.nvim'},
  {src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = {  ensure_installed = { "c", "cpp", "lua", "python" },nhighlight = { enable = true },
    },
  },
    --mason is broken
  {src = 'https://github.com/williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {src = 'https://github.com/williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup()
    end,
    opts = { ensure_installed = { "clangd", "pyright", "ruff" },
    },
  },
  {src = 'https://github.com/neovim/nvim-lspconfig',  },
  {src = 'https://github.com/hrsh7th/nvim-cmp'},
  {src = 'https://github.com/p00f/clangd_extensions.nvim'},
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
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ruff')

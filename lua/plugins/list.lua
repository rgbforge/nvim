vim.pack.add({
  --{
    --src = 'https://github.com/user/plugin3',
    -- -- Version constraint, see |vim.version.range()|
    --version = vim.version.range('1.0'),
    -- -- Git branch, tag, or commit hash
    --version = 'main',
  --},
-- Plugin's code can be used directly after `add()`
--plugin1 = require('plugin1')
  {src = 'nvim-tree/nvim-web-devicons', lazy = true },
  {src = 'catppuccin/nvim', name = "catppuccin", priority = 1000 },
  {src = 'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },
  {src = 'Mofiqul/vscode.nvim' },
  {src = 'ThePrimeagen/vim-be-good', cmd = "VimBeGood" },
  {src = 'nvim-lua/plenary.nvim'},
  {
    src = 'nvim-telescope/telescope.nvim',
    version = '0.1.8',
  },
  {
   src = 'NeogitOrg/neogit',
  },
  {
   src = 'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "cpp", "lua", "python" },
      highlight = { enable = true },
    },
  },
})

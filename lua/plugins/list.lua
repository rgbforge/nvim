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

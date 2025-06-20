return {
  { 
    "nvim-tree/nvim-web-devicons", 
    lazy = true 
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {  
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",  
    config = function()
      require("vim-be-good").menu{} 
    end,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate'
  }
}

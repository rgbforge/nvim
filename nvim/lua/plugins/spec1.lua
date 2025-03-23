return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
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
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {  "ThePrimeagen/vim-be-good",
  cmd = "VimBeGood",  
  config = function()
    require("VimBeGood").setup {} 
  end,
  },

}

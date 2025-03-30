return {
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
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {  "ThePrimeagen/vim-be-good",
  cmd = "VimBeGood",  
  config = function()
    require("vim-be-good").menu{} 
  end,
  },
}

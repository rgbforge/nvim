return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
    config = function()
      require("vim-be-good").setup({})
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
    	ensure_installed = {
     	  "c",
          "cpp",
          "lua",
          "python",
    	},
    	highlight = {
      	  enable = true,
    	},
     },
  },
}

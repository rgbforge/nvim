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
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {  "ThePrimeagen/vim-be-good",
  cmd = "VimBeGood",  
  config = function()
    require("vim-be-good").menu{} 
  end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,  -- Load during startup
    priority = 1000,  -- High priority to load before other plugins
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        -- Your existing configuration
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
      
      -- Apply the colorscheme
      vim.cmd.colorscheme "vscode"
    end,
  },
}

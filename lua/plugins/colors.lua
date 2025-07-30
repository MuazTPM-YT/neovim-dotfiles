local Color = require("config.colors")

return {
  { "erikbackman/brightburn.vim" },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "transparent",
          floats = "transparent",
        },
      })
    end,
  },

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    config = function()
      vim.g.moonflyTransparent = true
      vim.g.moonflyItalics = false
    end,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    config = function()
      vim.opt.background = "dark"
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
    end,
  },

  {
    "dasupradyumna/midnight.nvim",
    name = "midnight",
    config = function() end,
  },

  {
    "olimorris/onedarkpro.nvim",
    name = "onedark",
    config = function() end,
  },

  {
    "EdenEast/nightfox.nvim",
    name = "carbonfox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("carbonfox")
    end,
  },
}

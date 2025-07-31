local Color = require("config.colors")

return {
  { "erikbackman/brightburn.vim" },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
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
        options = {
          transparent = true,

          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
        disable_background = true,
        styles = {
          italic = false,
        },
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          vim.defer_fn(function()
            local highlights_to_fix = {
              "NormalFloat",
              "FloatBorder",
              "Pmenu",
              "PmenuSel",
              "TelescopeNormal",
              "TelescopeBorder",
              "TelescopePromptNormal",
              "TelescopePromptBorder",
              "TelescopeResultsBorder",
              "TelescopePreviewBorder",
              "VertSplit",
            }
            for _, group in ipairs(highlights_to_fix) do
              pcall(vim.api.nvim_set_hl, 0, group, { bg = "NONE" })
            end
          end, 100)
        end,
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
      require("nightfox").setup({
        options = {
          transparent = true,

          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
        disable_background = false,
      })

      vim.cmd.colorscheme("carbonfox")
    end,
  },
}

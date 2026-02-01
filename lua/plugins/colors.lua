-- local Color = require("config.colors")

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
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
          italic = false,
        },
      })
      vim.cmd.colorscheme("rose-pine")

      -- Force transparency for bufferline and lualine
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local hl_groups = {
            "Normal",
            "NormalNC",
            "NormalFloat",
            "FloatBorder",
            "TelescopeNormal",
            "TelescopeBorder",
            "TelescopePromptNormal",
            "TelescopePromptBorder",
            "BufferLineFill",
            "BufferLineBackground",
            "StatusLine",
            "StatusLineNC",
          }
          for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE" })
          end
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
    name = "nightfox",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,

          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },

          groups = {
            all = {
              StatusLine = { bg = "none" },
              StatusLineNC = { bg = "none" },
            },
          },
        },
      })
    end,
  },
}

-- Dark colorschemes. All are lazy: lazy.nvim loads one only when it is applied.
-- Transparency is set per theme where it has an option, and forced for the
-- core groups by lua/config/colors.lua, so every theme uses the terminal's bg.
-- Switch with `:Theme` (picker with live preview) or `:Theme <name>`.

local function theme(repo, spec)
  spec = spec or {}
  spec[1] = repo
  spec.lazy = true
  return spec
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("config.colors").load()
      end,
    },
  },

  theme("folke/tokyonight.nvim", {
    opts = {
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  }),
  theme("catppuccin/nvim", { name = "catppuccin", opts = { flavour = "mocha", transparent_background = true } }),
  theme("rose-pine/neovim", {
    name = "rose-pine",
    main = "rose-pine",
    opts = { styles = { transparency = true, italic = false } },
  }),
  theme("rebelot/kanagawa.nvim", { opts = { transparent = true } }),
  theme("ellisonleao/gruvbox.nvim", { opts = { transparent_mode = true } }),
  theme("EdenEast/nightfox.nvim", {
    opts = {
      options = {
        transparent = true,
        styles = { comments = "italic", keywords = "bold", types = "italic,bold" },
      },
    },
  }),
  theme("olimorris/onedarkpro.nvim", { name = "onedark", main = "onedarkpro", opts = { options = { transparency = true } } }),
  theme("Mofiqul/dracula.nvim", { opts = { transparent_bg = true } }),
  theme("gbprod/nord.nvim", { main = "nord", opts = { transparent = true } }),
  theme("AlexvZyl/nordic.nvim", { opts = { transparent = { bg = true, float = true } } }),
  theme("rmehri01/onenord.nvim", { opts = { disable = { background = true, float_background = true } } }),
  theme("marko-cerovac/material.nvim", { opts = { disable = { background = true } } }),
  theme("projekt0n/github-nvim-theme", { main = "github-theme", opts = { options = { transparent = true } } }),
  theme("Mofiqul/vscode.nvim", { opts = { transparent = true } }),
  theme("scottmckendry/cyberdream.nvim", { opts = { transparent = true } }),
  theme("loctvl842/monokai-pro.nvim", { opts = { transparent_background = true } }),
  theme("craftzdog/solarized-osaka.nvim", { opts = { transparent = true } }),
  theme("ribru17/bamboo.nvim", { opts = { transparent = true } }),
  theme("oxfist/night-owl.nvim", { opts = { transparent_background = true } }),
  theme("olivercederborg/poimandres.nvim", {
    opts = { disable_background = true, disable_float_background = true },
  }),
  theme("datsfilipe/vesper.nvim", { opts = { transparent = true } }),
  theme("miikanissi/modus-themes.nvim", { main = "modus-themes", opts = { transparent = true } }),
  theme("tiagovla/tokyodark.nvim", { opts = { transparent_background = true } }),
  theme("Everblush/nvim", { name = "everblush", opts = { transparent_background = true } }),
  theme("sho-87/kanagawa-paper.nvim", { opts = { transparent = true } }),
  theme("vague2k/vague.nvim", { opts = { transparent = true } }),
  theme("diegoulloao/neofusion.nvim", { opts = { transparent_mode = true } }),
  theme("eldritch-theme/eldritch.nvim", { opts = { transparent = true } }),
  theme("slugbyte/lackluster.nvim"),
  theme("Shatur/neovim-ayu"),
  theme("nyoom-engineering/oxocarbon.nvim"),
  theme("savq/melange-nvim"),
  theme("xero/miasma.nvim"),
  theme("dgox16/oldworld.nvim"),
  theme("kepano/flexoki-neovim"),
  theme("embark-theme/vim", { name = "embark" }),
  theme("mellow-theme/mellow.nvim", {
    init = function()
      vim.g.mellow_transparent = true
    end,
  }),
  theme("NTBBloodbath/doom-one.nvim", {
    init = function()
      vim.g.doom_one_transparent_background = true
    end,
  }),
  theme("bluz71/vim-moonfly-colors", {
    name = "moonfly",
    init = function()
      vim.g.moonflyTransparent = true
      vim.g.moonflyItalics = false
    end,
  }),
  theme("bluz71/vim-nightfly-colors", {
    name = "nightfly",
    init = function()
      vim.g.nightflyTransparent = true
      vim.g.nightflyItalics = false
    end,
  }),
  theme("sainnhe/everforest", {
    init = function()
      vim.g.everforest_transparent_background = 2
    end,
  }),
  theme("sainnhe/gruvbox-material", {
    init = function()
      vim.g.gruvbox_material_transparent_background = 2
    end,
  }),
  theme("sainnhe/sonokai", {
    init = function()
      vim.g.sonokai_transparent_background = 2
    end,
  }),
  theme("sainnhe/edge", {
    init = function()
      vim.g.edge_transparent_background = 2
    end,
  }),
  theme("dasupradyumna/midnight.nvim", { name = "midnight" }),
  theme("nanotech/jellybeans.vim"),
  theme("erikbackman/brightburn.vim"),
}

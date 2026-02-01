return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  priority = 1100,
  opts = {
    options = {
      theme = "auto", -- Use the colorscheme's theme
    },
    highlights = {
      fill = { bg = "NONE" },
      background = { bg = "NONE" },
      buffer_visible = { bg = "NONE" },
      buffer_selected = { bg = "NONE" },
      separator = { bg = "NONE" },
      separator_selected = { bg = "NONE" },
      separator_visible = { bg = "NONE" },
      offset_separator = { bg = "NONE" },
    },
  },
}

return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.move").setup({
        mappings = {
          left = "<M-a>",
          right = "<M-d>",
          down = "<M-s>",
          up = "<M-w>",

          line_left = "<M-a>",
          line_right = "<M-d>",
          line_down = "<M-s>",
          line_up = "<M-w>",
        },
        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
}

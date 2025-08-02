return {
  { "echasnovski/mini.nvim", version = false },

  {
    "echasnovski/mini.move",
    config = function()
      local MiniMove = require("mini.move")
      MiniMove.setup({
        mappings = {
          left = "<M-a>",
          right = "<M-d>",
          down = "<M-s>",
          up = "<M-w>",

          line_left = "<M-a>",
          line_right = "<M-d>",
          line_down = "<M-s>",
          line_up = "<M-a>",
        },

        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
}

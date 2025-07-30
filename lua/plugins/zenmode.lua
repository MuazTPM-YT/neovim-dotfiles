return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
  config = function()
    require("zen-mode").setup({
      window = {
        width = 80,
        options = {
          number = false,
          relativenumber = false,
        },
      },
    })
  end,
}

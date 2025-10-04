return {
  "MuazTPM-YT/leetvim.nvim",
  name = "leetvim",
  cmd = { "LeetvimTemplate", "LeetvimAuth" },
  keys = {
    { "<leader>lt", ":LeetvimTemplate python ", desc = "Leetvim Template" },
    { "<leader>la", ":LeetvimAuth<cr>", desc = "Leetcode Auth" },
  },

  config = function()
    require("leetvim").setup({
      base_dir = vim.fn.expand("~/Documents/Software/leetcode"),
      filename_pattern = "{number:03d}.{ext}",
      include_test_stub = true,
      default_language = "python",
      create_subdirs = false,
    })
  end,
}

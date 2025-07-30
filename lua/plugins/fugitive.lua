return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Glog", "Gedit" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status (fugitive)" },
  },
}

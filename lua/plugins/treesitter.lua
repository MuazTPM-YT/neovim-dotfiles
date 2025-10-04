return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "cpp", "lua", "python" },
      highlight = { enable = true },
      indent = { enable = true },
      sync_install = false,
      auto_install = true,
    })
  end,
}

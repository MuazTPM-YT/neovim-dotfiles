return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "gdscript",
        "godot_resource",
        "gdshader",
        "lua",
        "vim",
        "javascript",
        "typescript",
        "python",
        "html",
        "css",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
      auto_install = true,
    })
  end,
}

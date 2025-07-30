return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/custom/snippets" })
    end,
  },
}

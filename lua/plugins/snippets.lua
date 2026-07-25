return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      -- Files here are keyed by filetype: snippets/cpp.lua loads for `cpp`.
      -- A name that isn't a filetype (the old cp-cpp.lua) silently never loads.
      require("luasnip.loaders.from_lua").load({
        paths = { vim.fn.stdpath("config") .. "/lua/custom/snippets" },
      })
      return opts
    end,
  },
}

return {
  "gelguy/wilder.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "romgrk/fzy-lua-native",
  },
  config = function()
    local wilder = require("wilder")

    wilder.setup({ modes = { "0", "9", "8" } })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        min_width = "20%", -- minimum height of the popupmenu, can also be a number
        max_height = "15%", -- to set a fixed height, set max_height to the same value
        reverse = 0, -- if 1, shows the candidates from bottom to top
        highlighter = {
          wilder.lua_pcre2_highlighter(), -- Requires luarocks install pcre2
          wilder.lua_fzy_highlighter(), -- Requires fzy-lua-native
        },
        highlights = {
          default = wilder.make_hl(
            "WilderPopupMenu",
            "Pmenu",
            { { a = 1 }, { a = 1 }, { background = "#1E212B" } } -- Adjust background color
          ),
          accent = wilder.make_hl(
            "WilderAccent",
            "Pmenu",
            { { a = 1 }, { a = 1 }, { foreground = "#58FFD6", background = "#1e1e2e" } }
          ),
        },
        border = "single",
      }))
    )
  end,
}

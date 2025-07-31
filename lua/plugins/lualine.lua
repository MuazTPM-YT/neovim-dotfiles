return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local theme = {
      normal = { a = { bg = "none" }, b = { bg = "none" }, c = { bg = "none" } },
      insert = { a = { bg = "none" }, b = { bg = "none" }, c = { bg = "none" } },
      visual = { a = { bg = "none" }, b = { bg = "none" }, c = { bg = "none" } },
      replace = { a = { bg = "none" }, b = { bg = "none" }, c = { bg = "none" } },
      command = { a = { bg = "none" }, b = { bg = "none" }, c = { bg = "none" } },
      inactive = { a = { bg = "none" }, b = { bg = "none" }, c = { bg = "none" } },
    }
    opts.options.theme = theme
  end,
}

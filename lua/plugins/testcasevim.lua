return {
  "MuazTPM-YT/testcasevim.nvim",
  name = "testcasevim",
  keys = {
    {
      "<leader><CR>",
      function()
        require("testcasevim").run()
      end,
      desc = "Run C++ Testcase",
    },
  },
}

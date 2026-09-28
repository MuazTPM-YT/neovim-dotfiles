return {
  -- Local checkout, so edits apply without a push. Swap back to
  -- "MuazTPM-YT/testcasevim.nvim" to track GitHub instead.
  dir = "~/Documents/Software/testcasevim.nvim",
  name = "testcasevim",
  cmd = { "Testcase", "TestcaseRun", "TestcaseStop", "TestcaseClose" },
  keys = {
    {
      "<leader><CR>",
      function()
        require("testcasevim").run()
      end,
      desc = "Toggle testcase panes",
    },
  },
  opts = {
    languages = {
      cpp = {
        compile = {
          -- Plugin defaults plus a libstdc++ backtrace, so an out-of-bounds
          -- `a[i]` reports the exact source line. Needs GCC 13+.
          debug = {
            "g++", "-std=c++17", "-O2", "-g", "-Wall", "-Wextra", "-Wshadow",
            "-fsanitize=address,undefined", "-fno-omit-frame-pointer",
            "-D_GLIBCXX_DEBUG", "-D_GLIBCXX_DEBUG_BACKTRACE", "-DDEBUG",
            "{src}", "-o", "{exe}", "-lstdc++exp",
          },
          release = { "g++", "-std=c++17", "-O2", "{src}", "-o", "{exe}" },
        },
      },
    },
  },
}

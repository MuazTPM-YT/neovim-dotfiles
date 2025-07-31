-- C++ UTILS
_G.MyCppUtils = {}

function MyCppUtils.insert_boilerplate()
  local lines = {
    "#include <bits/stdc++.h>",
    "#include <cmath>",
    "#include <algorithm>",
    "#include <string>",
    "",
    "using namespace std;",
    "",
    "typedef long long ll;",
    "typedef vector<int> vi;",
    "typedef vector<ll> vll;",
    "typedef pair<int, int> pii;",
    "",
    "#define all(x) (x).begin(), (x).end()",
    "#define sz(x) (int)(x).size()",
    "",
    "void solve() {",
    "    ",
    "}",
    "",
    "int main() {",
    "    ios_base::sync_with_stdio(false);",
    "    cin.tie(NULL);",
    "",
    "    int t = 1;",
    "    // cin >> t;",
    "",
    "    while (t--) {",
    "        solve();",
    "    }",
    "",
    "    return 0;",
    "}",
  }
  vim.api.nvim_put(lines, "l", true, true)
  vim.api.nvim_win_set_cursor(0, { 14, 4 })
end

-- PYTHON UTILS
_G.MyPythonUtils = {}

function MyPythonUtils.insert_boilerplate()
  local lines = {
    "import sys",
    "",
    "input = sys.stdin.readline",
    "# sys.setrecursionlimit(10**6)",
    "",
    "def solve():",
    "    pass",
    "",
    "",
    "def main():",
    "    try:",
    "        t = int(input())",
    "",
    "    except (IOError, ValueError):",
    "        t = 1",
    "",
    "    for _ in range(t):",
    "        solve()",
    "",
    "",
    'if __name__ == "__main__":',
    "    main()",
    "",
  }
  vim.api.nvim_put(lines, "l", true, true)
  vim.api.nvim_win_set_cursor(0, { 12, 4 })
end

-- AUTOCMD SETUP
local custom_augroup = vim.api.nvim_create_augroup("MyBufferMappings", { clear = true })

-- Autocommand for C++
vim.api.nvim_create_autocmd("FileType", {
  group = custom_augroup,
  pattern = "cpp",
  callback = function()
    vim.keymap.set("n", "<leader>cp", "<Cmd>lua MyCppUtils.insert_boilerplate()<CR>", {
      buffer = true,
      silent = true,
      desc = "Insert C++ boilerplate",
    })
  end,
})

-- Autocommand for Python
vim.api.nvim_create_autocmd("FileType", {
  group = custom_augroup,
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<leader>py", "<Cmd>lua MyPythonUtils.insert_boilerplate()<CR>", {
      buffer = true,
      silent = true,
      desc = "Insert Python boilerplate",
    })
  end,
})

local custom_augroup = vim.api.nvim_create_augroup("MyBufferMappings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = custom_augroup,
  pattern = "cpp",
  callback = function()
    vim.keymap.set("n", "<leader>cp", "<Cmd>lua MyCppUtils.insert_boilerplate()<CR>", { buffer = true, silent = true })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = custom_augroup,
  pattern = "python",
  callback = function()
    vim.keymap.set(
      "n",
      "<leader>py",
      "<Cmd>lua MyPythonUtils.insert_boilerplate()<CR>",
      { buffer = true, silent = true }
    )
  end,
})

local transparency_fix_augroup = vim.api.nvim_create_augroup("UniversalTransparencyFix", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = transparency_fix_augroup,
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      local highlights_to_fix = {
        "NormalFloat",
        "FloatBorder",
        "Pmenu",
        "PmenuSel",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopePromptBorder",
        "TelescopeResultsBorder",
        "TelescopePreviewBorder",
        "VertSplit",
        "WinSeparator",
        "CmdLine",
        "StatusLine",
        "StatusLineNC",
        "TabLine",
        "TabLineFill",
        "TabLineSel",
        "NeoTreeNormal",
        "SnacksStatus",
        "SnacksInput",
      }
      for _, group in ipairs(highlights_to_fix) do
        pcall(vim.api.nvim_set_hl, 0, group, { fg = "NONE", bg = "NONE" })
      end
    end, 10)
  end,
})

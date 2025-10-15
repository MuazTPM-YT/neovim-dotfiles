-- C++ UTILS
_G.MyCppUtils = {}

function MyCppUtils.insert_boilerplate()
  local lines = {
    "#include <bits/stdc++.h>",
    "#include <cmath>",
    "#include <algorithm>",
    "#include <string>",
    "#include <unordered_map>",
    "#include <map>",
    "#include <queue>",
    "using namespace std;",
    "",
    "typedef long long ll;",
    "typedef vector<int> vi;",
    "typedef vector<string> vs;",
    "typedef vector<ll> vll;",
    "typedef pair<int, int> pii;",
    "typedef pair<ll, ll> pll;",
    "typedef unordered_map<int, int> umapii;",
    "typedef unordered_map<ll, ll> umapll;",
    "typedef map<int, int> mapii;",
    "typedef map<ll, ll> mapll;",
    "",
    "#define ceil(n, m) (((n) + (m) - 1) / (m))",
    "#define add_mod(a, b, m) (((a % m) + (b % m)) % m)",
    "#define sub_mod(a, b, m) (((a % m) - (b % m) + m) % m)",
    "#define mul_mod(a, b, m) (((a % m) * (b % m)) % m)",
    "#define rep(i, a, b) for (int i=a; i<(b); ++i)",
    "#define trav(a, x) for (auto& a: x)",
    "#define all(vec) vec.begin(), vec.end()",
    "#define rall(vec) vec.rbegin(), vec.rend()",
    "#define len(x) (int)(x).size()",
    '#define yes cout << "YES\\n"',
    '#define no cout << "NO\\n"',
    "#define display(arr) for (int x: arr) cout << x << ' '; cout << '\\n';",
    "",
    "void solve() {",
    "    ",
    "}",
    "",
    "int main() {",
    "    ios_base::sync_with_stdio(false);",
    "    cin.tie(NULL);",
    "",
    "    int t = 1; cin >> t;",
    "    while (t--) solve();",
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

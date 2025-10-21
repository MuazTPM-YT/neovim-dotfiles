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
    "typedef long double ld;",
    "typedef complex<ld> cd;",
    "typedef pair<int, int> pii;",
    "typedef pair<ll, ll> pll;",
    "typedef pair<ld, ld> pld;",
    "typedef vector<int> vi;",
    "typedef vector<string> vs;",
    "typedef vector<ll> vll;",
    "typedef vector<ld> vld;",
    "typedef vector<cd> vcd;",
    "typedef vector<pll> vpll;",
    "typedef unordered_map<int, int> umapii;",
    "typedef unordered_map<ll, ll> umapll;",
    "typedef map<int, int> mapii;",
    "typedef map<ll, ll> mapll;",
    "",
    "#define mp make_pair",
    "#define pb push_back",
    "#define f first",
    "#define s second",
    "#define lb lower_bound",
    "#define ub upper_bound",
    "#define ins insert",
    "#define add_mod(a, b, m) (((a % m) + (b % m)) % m)",
    "#define sub_mod(a, b, m) (((a % m) - (b % m) + m) % m)",
    "#define mul_mod(a, b, m) (((a % m) * (b % m)) % m)",
    "",
    "#define FOR(i, a, b) for (int i=a; i<(b); i++)",
    "#define F0R(i, a) for (int i=0; i<(a); i++)",
    "#define FORd(i,a,b) for (int i = (b)-1; i >= a; i--)",
    "#define F0Rd(i,a) for (int i = (a)-1; i >= 0; i--)",
    "#define trav(a,x) for (auto& a : x)",
    "#define uid(a, b) uniform_int_distribution<int>(a, b)(rng)",
    "#define all(vec) vec.begin(), vec.end()",
    "#define rall(vec) vec.rbegin(), vec.rend()",
    "",
    "#define len(x) (int)(x).size()",
    '#define yes cout << "YES\\n"',
    '#define no cout << "NO\\n"',
    "#define display(arr) for (int x: arr) cout << x << ' '; cout << '\\n';",
    "",
    "void __print(int x) {cerr << x;}",
    "void __print(long x) {cerr << x;}",
    "void __print(long long x) {cerr << x;}",
    "void __print(unsigned x) {cerr << x;}",
    "void __print(unsigned long x) {cerr << x;}",
    "void __print(unsigned long long x) {cerr << x;}",
    "void __print(float x) {cerr << x;}",
    "void __print(double x) {cerr << x;}",
    "void __print(long double x) {cerr << x;}",
    "void __print(char x) {cerr << '\\'' << x << '\\'';}",
    "void __print(const char *x) {cerr << '\\\"' << x << '\\\"';}",
    "void __print(const string &x) {cerr << '\\\"' << x << '\\\"';}",
    'void __print(bool x) {cerr << (x ? "true" : "false");}',
    "",
    "template<typename T, typename V>",
    "void __print(const pair<T, V> &x);",
    "template<typename T>",
    'void __print(const T &x) {int f = 0; cerr << \'{\'; for (auto &i: x) cerr << (f++ ? ", " : ""), __print(i); cerr << "}";}',
    "template<typename T, typename V>",
    "void __print(const pair<T, V> &x) {cerr << '{'; __print(x.first); cerr << \", \"; __print(x.second); cerr << '}';}",
    'void _print() {cerr << "]\\n";}',
    "template <typename T, typename... V>",
    'void _print(T t, V... v) {__print(t); if (sizeof...(v)) cerr << ", "; _print(v...);}',
    "#ifdef DEBUG",
    '#define dbg(x...) cerr << "\\e[91m"<<__func__<<":"<<__LINE__<<" [" << #x << "] = ["; _print(x); cerr << "\\e[39m" << endl;',
    "#else",
    "#define dbg(x...)",
    "#endif",
    "",
    "const int MOD = 1e9+7;",
    "const char nl = '\\n';",
    "const int MX = 1e6+1;",
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
    "    while (t--)",
    "    solve();",
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

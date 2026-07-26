-- Competitive-programming templates.
--
-- Each template declares the text to insert plus an `anchor` line; after
-- insertion the cursor lands on the line *following* the anchor, so you drop
-- straight into the body of `solve()` instead of a hardcoded line number.

local M = {}

-- NOTE: long strings ([==[ ]==]) keep backslashes literal, so the C++ escape
-- sequences below ("\n", "\e[91m") need no Lua-level escaping.
local CPP_TEMPLATE = [==[
#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>

using namespace std;
using namespace __gnu_pbds;

typedef long long ll;
typedef long double ld;
typedef complex<ld> cd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef pair<ld, ld> pld;
typedef vector<int> vi;
typedef vector<string> vs;
typedef vector<bool> vb;
typedef vector<ll> vll;
typedef vector<ld> vld;
typedef vector<cd> vcd;
typedef vector<pii> vpii;
typedef vector<pll> vpll;
typedef unordered_map<int, int> umapii;
typedef unordered_map<ll, ll> umapll;
typedef map<int, int> mapii;
typedef map<ll, ll> mapll;

typedef tree<
    pll,
    null_type,
    less<pll>,
    rb_tree_tag,
    tree_order_statistics_node_update
> ordered_set;

mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());

#define mp make_pair
#define pb push_back
#define ppb pop_back
#define fi first
#define se second
#define lb lower_bound
#define ub upper_bound
#define ins insert
#define add_mod(a, b, m) ((((ll)(a) % (m)) + ((ll)(b) % (m))) % (m))
#define sub_mod(a, b, m) ((((ll)(a) % (m)) - ((ll)(b) % (m)) + (m)) % (m))
#define mul_mod(a, b, m) ((((ll)(a) % (m)) * ((ll)(b) % (m))) % (m))
#define uid(a, b) uniform_int_distribution<int>(a, b)(rng)
#define all(x) (x).begin(), (x).end()
#define rall(x) (x).rbegin(), (x).rend()
#define len(x) (int)(x).size()
#define yes cout << "YES\n"
#define no cout << "NO\n"
#define display(x) do { for (auto &_e : (x)) cout << _e << ' '; cout << '\n'; } while (0)

void __print(int x) {cerr << x;}
void __print(long x) {cerr << x;}
void __print(long long x) {cerr << x;}
void __print(unsigned x) {cerr << x;}
void __print(unsigned long x) {cerr << x;}
void __print(unsigned long long x) {cerr << x;}
void __print(float x) {cerr << x;}
void __print(double x) {cerr << x;}
void __print(long double x) {cerr << x;}
void __print(char x) {cerr << '\'' << x << '\'';}
void __print(const char *x) {cerr << '"' << x << '"';}
void __print(const string &x) {cerr << '"' << x << '"';}
void __print(bool x) {cerr << (x ? "true" : "false");}

template<typename T, typename V>
void __print(const pair<T, V> &x);
template<typename T>
void __print(const T &x) {int f = 0; cerr << '{'; for (auto &i: x) cerr << (f++ ? ", " : ""), __print(i); cerr << "}";}
template<typename T, typename V>
void __print(const pair<T, V> &x) {cerr << '{'; __print(x.first); cerr << ", "; __print(x.second); cerr << '}';}
void _print() {cerr << "]\n";}
template <typename T, typename... V>
void _print(T t, V... v) {__print(t); if (sizeof...(v)) cerr << ", "; _print(v...);}
#ifdef DEBUG
#define dbg(x...) cerr << "\e[91m" << __func__ << ":" << __LINE__ << " [" << #x << "] = ["; _print(x); cerr << "\e[39m" << endl;
#else
#define dbg(x...)
#endif

const int MOD = 1e9 + 7;
const char nl = '\n';
const int MX = 1e6 + 1;

void solve() {
    
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int t = 1;
    cin >> t;
    while (t--) solve();

    return 0;
}
]==]

local PYTHON_TEMPLATE = [==[
import sys

input = sys.stdin.readline
# sys.setrecursionlimit(10**6)


def solve():
    pass


def main():
    t = int(input())  # single-test problem? replace with: t = 1
    for _ in range(t):
        solve()


if __name__ == "__main__":
    main()
]==]

local templates = {
  cpp = { text = CPP_TEMPLATE, anchor = "void solve() {" },
  python = { text = PYTHON_TEMPLATE, anchor = "def solve():" },
}

--- Insert a template and park the cursor in the body of `solve()`.
--- @param tmpl table { text = string, anchor = string }
local function insert_template(tmpl)
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.split(tmpl.text, "\n", { plain = true })

  -- `vim.split` on a trailing newline leaves an empty final element.
  if lines[#lines] == "" then
    table.remove(lines)
  end

  -- Replace the contents of a pristine buffer; otherwise insert below the cursor.
  local first = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
  local start
  if vim.api.nvim_buf_line_count(buf) == 1 and first == "" then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    start = 0
  else
    start = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(buf, start, start, false, lines)
  end

  -- Land on the line after the anchor, at its end, ready to type.
  local row, col = start + 1, 0
  for i, line in ipairs(lines) do
    if line == tmpl.anchor then
      row = start + i + 1
      col = #(lines[i + 1] or "")
      break
    end
  end

  vim.api.nvim_win_set_cursor(0, { math.min(row, vim.api.nvim_buf_line_count(buf)), col })
  vim.cmd("startinsert!")
end

function M.insert(filetype)
  local tmpl = templates[filetype or vim.bo.filetype]
  if not tmpl then
    vim.notify("No template for filetype: " .. tostring(filetype or vim.bo.filetype), vim.log.levels.WARN)
    return
  end
  insert_template(tmpl)
end

-- AUTOCMD SETUP
local custom_augroup = vim.api.nvim_create_augroup("MyBufferMappings", { clear = true })

local template_keys = {
  cpp = "<leader>cp",
  python = "<leader>py",
}

for filetype, lhs in pairs(template_keys) do
  vim.api.nvim_create_autocmd("FileType", {
    group = custom_augroup,
    pattern = filetype,
    desc = "Bind " .. filetype .. " boilerplate template",
    callback = function(args)
      vim.keymap.set("n", lhs, function()
        M.insert(filetype)
      end, {
        buffer = args.buf,
        silent = true,
        desc = "Insert " .. filetype .. " boilerplate",
      })
    end,
  })
end

return M

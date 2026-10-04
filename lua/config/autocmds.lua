-- Competitive-programming templates.

local M = {}

local CPP_TEMPLATE = [==[
#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace std;
using namespace __gnu_pbds;

typedef long long ll;
typedef unsigned long long ull;
typedef __int128 lll;
typedef unsigned __int128 ulll;
typedef long double ld;
typedef complex<double> cd;
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
typedef vector<vi> vvi;
typedef vector<vll> vvll;
typedef map<int, int> mapii;
typedef map<ll, ll> mapll;

constexpr int MOD = 1e9 + 7;
constexpr ll INF = 4e18;
constexpr int IINF = 1e9;
constexpr char nl = '\n';
constexpr ld PI = 3.14159265358979323846L;

mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());

#define mp make_pair
#define pb push_back
#define eb emplace_back
#define ppb pop_back
#define fi first
#define se second
#define lb lower_bound
#define ub upper_bound
#define add_mod(a, b, m) ((((ll)(a) % (m)) + ((ll)(b) % (m))) % (m))
#define sub_mod(a, b, m) ((((ll)(a) % (m)) - ((ll)(b) % (m)) + (m)) % (m))
#define mul_mod(a, b, m) ((((ll)(a) % (m)) * ((ll)(b) % (m))) % (m))
#define uid(a, b) uniform_int_distribution<ll>(a, b)(rng)
#define all(x) (x).begin(), (x).end()
#define rall(x) (x).rbegin(), (x).rend()
#define len(x) (int)(x).size()
#define yes cout << "YES\n"
#define no cout << "NO\n"

#ifdef DEBUG
template <class T> void __print(const T &x);
template <class A, class B> void __print(const pair<A, B> &p) { cerr << '{'; __print(p.first); cerr << ", "; __print(p.second); cerr << '}'; }
void __print(const string &x) { cerr << '"' << x << '"'; }
void __print(char x) { cerr << '\'' << x << '\''; }
void __print(bool x) { cerr << (x ? "true" : "false"); }
template <class T> void __print(const T &x) {
    if constexpr (is_arithmetic_v<T>) cerr << x;
    else { int f = 0; cerr << '{'; for (const auto &i : x) cerr << (f++ ? ", " : ""), __print(i); cerr << '}'; }
}
void _print() { cerr << "]\n"; }
template <class T, class... V> void _print(const T &t, const V &...v) { __print(t); if (sizeof...(v)) cerr << ", "; _print(v...); }
#define dbg(x...) cerr << __func__ << ":" << __LINE__ << " [" << #x << "] = [", _print(x)
#else
#define dbg(x...)
#endif

template <class T, class Cmp = less<T>>
using ordered_set = tree<T, null_type, Cmp, rb_tree_tag, tree_order_statistics_node_update>;

template <class K, class V, class Cmp = less<K>>
using ordered_map = tree<K, V, Cmp, rb_tree_tag, tree_order_statistics_node_update>;

template <class T> struct ordered_multiset {
    ordered_set<pair<T, int>> s;
    int stamp = 0;
    void insert(const T &x) { s.insert({x, stamp++}); }
    bool erase(const T &x) {
        auto it = s.lower_bound({x, INT_MIN});
        if (it == s.end() || it->first != x) return false;
        s.erase(it);
        return true;
    }
    int order_of_key(const T &x) const { return (int)s.order_of_key({x, INT_MIN}); }
    int count(const T &x) const { return (int)s.order_of_key({x, INT_MAX}) - order_of_key(x); }
    T operator[](int k) const { return s.find_by_order(k)->first; }
    int size() const { return (int)s.size(); }
    bool empty() const { return s.empty(); }
    void clear() { s.clear(), stamp = 0; }
};

template <class T> bool ckmin(T &a, const T &b) { return b < a ? (a = b, true) : false; }
template <class T> bool ckmax(T &a, const T &b) { return a < b ? (a = b, true) : false; }

ll pw(ll b, ll e, ll m = MOD) {
    ll r = 1 % m;
    for (b %= m, b += (b < 0) * m; e > 0; e >>= 1, b = b * b % m)
        if (e & 1) r = r * b % m;
    return r;
}
ll inv(ll a, ll m = MOD) { return pw(a, m - 2, m); }

ll floor_div(ll a, ll b) { return a / b - ((a ^ b) < 0 && a % b != 0); }
ll ceil_div(ll a, ll b) { return a / b + ((a ^ b) > 0 && a % b != 0); }

void solve() {
    
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int t = 1;
    cin >> t;
    while (t--)
        solve();

    return 0;
}
]==]

local CPP_BASIC_TEMPLATE = [==[
#include <bits/stdc++.h>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    

    return 0;
}
]==]

local PYTHON_TEMPLATE = [==[
import sys
from collections import Counter, defaultdict, deque

input = lambda: sys.stdin.readline().rstrip("\r\n")
ii = lambda: int(input())
mi = lambda: map(int, input().split())
li = lambda: list(map(int, input().split()))


def solve():
    pass


def main():
    t = 1
    t = ii()
    for _ in range(t):
        solve()


main()
]==]

local templates = {
  cpp = { text = CPP_TEMPLATE, anchor = "void solve() {" },
  cpp_basic = { text = CPP_BASIC_TEMPLATE, anchor = "    cin.tie(nullptr);", offset = 2 },
  python = { text = PYTHON_TEMPLATE, anchor = "def solve():" },
}

--- Insert a template and park the cursor in the body of `solve()`.
--- @param tmpl table { text = string, anchor = string, offset = number? }
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

  -- Land `offset` lines after the anchor (default 1), at its end, ready to type.
  local offset = tmpl.offset or 1
  local row, col = start + 1, 0
  for i, line in ipairs(lines) do
    if line == tmpl.anchor then
      row = start + i + offset
      col = #(lines[i + offset] or "")
      break
    end
  end

  vim.api.nvim_win_set_cursor(0, { math.min(row, vim.api.nvim_buf_line_count(buf)), col })
  vim.cmd("startinsert!")
end

function M.insert(name)
  local tmpl = templates[name or vim.bo.filetype]
  if not tmpl then
    vim.notify("No template: " .. tostring(name or vim.bo.filetype), vim.log.levels.WARN)
    return
  end
  insert_template(tmpl)
end

-- AUTOCMD SETUP
local custom_augroup = vim.api.nvim_create_augroup("MyBufferMappings", { clear = true })

local template_keys = {
  { filetype = "cpp", lhs = "<leader>cp", name = "cpp" },
  { filetype = "cpp", lhs = "<leader>bp", name = "cpp_basic" },
  { filetype = "python", lhs = "<leader>py", name = "python" },
}

for _, key in ipairs(template_keys) do
  vim.api.nvim_create_autocmd("FileType", {
    group = custom_augroup,
    pattern = key.filetype,
    desc = "Bind " .. key.name .. " boilerplate template",
    callback = function(args)
      vim.keymap.set("n", key.lhs, function()
        M.insert(key.name)
      end, {
        buffer = args.buf,
        silent = true,
        desc = "Insert " .. key.name .. " boilerplate",
      })
    end,
  })
end

return M

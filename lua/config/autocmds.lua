-- Competitive-programming templates.

local M = {}

local CPP_TEMPLATE = [==[
#ifdef FASTOPT
#pragma GCC optimize("O3,unroll-loops")
#pragma GCC target("avx2,bmi,bmi2,lzcnt,popcnt")
#endif

#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>

using namespace std;
using namespace __gnu_pbds;

typedef long long ll;
typedef unsigned long long ull;
typedef __int128 lll;
typedef long double ld;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef vector<int> vi;
typedef vector<ll> vll;
typedef vector<string> vs;
typedef vector<bool> vb;
typedef vector<pii> vpii;
typedef vector<pll> vpll;
typedef vector<vi> vvi;
typedef vector<vll> vvll;

constexpr int MOD = 1'000'000'007;
constexpr int MOD2 = 998'244'353;
constexpr ll INF = 4e18;
constexpr int IINF = 1e9;
constexpr char nl = '\n';
constexpr ld PI = 3.14159265358979323846L;
constexpr int dx[] = {1, -1, 0, 0, 1, 1, -1, -1};
constexpr int dy[] = {0, 0, 1, -1, 1, -1, 1, -1};

mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());

#define pb push_back
#define eb emplace_back
#define fi first
#define se second
#define all(x) (x).begin(), (x).end()
#define rall(x) (x).rbegin(), (x).rend()
#define len(x) (int)(x).size()
#define uniq(x) sort(all(x)), (x).erase(unique(all(x)), (x).end())
#define popcnt(x) __builtin_popcountll(x)
#define yes cout << "YES\n"
#define no cout << "NO\n"

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
ll rnd(ll a, ll b) { return uniform_int_distribution<ll>(a, b)(rng); }

template <int MD> struct Mint {
    int v;
    Mint() : v(0) {}
    Mint(ll x) : v(int(x % MD)) { if (v < 0) v += MD; }
    Mint &operator+=(const Mint &o) { if ((v += o.v) >= MD) v -= MD; return *this; }
    Mint &operator-=(const Mint &o) { if ((v -= o.v) < 0) v += MD; return *this; }
    Mint &operator*=(const Mint &o) { v = int((ll)v * o.v % MD); return *this; }
    Mint &operator/=(const Mint &o) { return *this *= o.inv(); }
    Mint pow(ll e) const { Mint r = 1, b = *this; for (; e > 0; e >>= 1, b *= b) if (e & 1) r *= b; return r; }
    Mint inv() const { return pow(MD - 2); }
    Mint operator-() const { return Mint() - *this; }
    friend Mint operator+(Mint a, const Mint &b) { return a += b; }
    friend Mint operator-(Mint a, const Mint &b) { return a -= b; }
    friend Mint operator*(Mint a, const Mint &b) { return a *= b; }
    friend Mint operator/(Mint a, const Mint &b) { return a /= b; }
    friend bool operator==(const Mint &a, const Mint &b) { return a.v == b.v; }
    friend bool operator!=(const Mint &a, const Mint &b) { return a.v != b.v; }
    friend ostream &operator<<(ostream &os, const Mint &a) { return os << a.v; }
    friend istream &operator>>(istream &is, Mint &a) { ll x; is >> x; a = Mint(x); return is; }
};
typedef Mint<MOD> mint;

template <class T, class Cmp = less<T>>
using ordered_set = tree<T, null_type, Cmp, rb_tree_tag, tree_order_statistics_node_update>;
template <class K, class V, class Cmp = less<K>>
using ordered_map = tree<K, V, Cmp, rb_tree_tag, tree_order_statistics_node_update>;

struct custom_hash {
    static ull splitmix64(ull x) {
        x += 0x9e3779b97f4a7c15ULL;
        x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9ULL;
        x = (x ^ (x >> 27)) * 0x94d049bb133111ebULL;
        return x ^ (x >> 31);
    }
    size_t operator()(ull x) const {
        static const ull SEED = chrono::steady_clock::now().time_since_epoch().count();
        return splitmix64(x + SEED);
    }
    size_t operator()(const pair<ull, ull> &p) const { return (*this)(p.first * 0x9e3779b97f4a7c15ULL ^ p.second); }
};
template <class K, class V> using hmap = gp_hash_table<K, V, custom_hash>;
template <class K, class V> using umap = unordered_map<K, V, custom_hash>;
template <class K> using uset = unordered_set<K, custom_hash>;
template <class T> using min_heap = priority_queue<T, vector<T>, greater<T>>;

// cin >> v reads every element of a pre-sized vector; cout << v prints it space-separated.
template <class A, class B> istream &operator>>(istream &is, pair<A, B> &p) { return is >> p.first >> p.second; }
template <class A, class B> ostream &operator<<(ostream &os, const pair<A, B> &p) { return os << p.first << ' ' << p.second; }
template <class T> istream &operator>>(istream &is, vector<T> &v) {
    for (auto &x : v) is >> x;
    return is;
}
template <class T> ostream &operator<<(ostream &os, const vector<T> &v) {
    for (size_t i = 0; i < v.size(); ++i) os << (i ? " " : "") << v[i];
    return os;
}
istream &operator>>(istream &is, lll &x) {
    string s;
    is >> s;
    x = 0;
    for (char c : s) if (c != '-') x = x * 10 + (c - '0');
    if (!s.empty() && s[0] == '-') x = -x;
    return is;
}
ostream &operator<<(ostream &os, lll x) {
    if (x == 0) return os << '0';
    string s;
    bool neg = x < 0;
    while (x != 0) s += char('0' + abs(int(x % 10))), x /= 10;
    if (neg) s += '-';
    reverse(all(s));
    return os << s;
}

void setIO(const string &name = "") {
    if (!name.empty()) {
        (void)!freopen((name + ".in").c_str(), "r", stdin);
        (void)!freopen((name + ".out").c_str(), "w", stdout);
    }
}

#ifdef DEBUG
template <class T, class = void> struct is_iterable : false_type {};
template <class T> struct is_iterable<T, void_t<decltype(begin(declval<const T &>()))>> : true_type {};
template <class T> void __print(const T &x);
template <class A, class B> void __print(const pair<A, B> &p) { cerr << '{'; __print(p.first); cerr << ", "; __print(p.second); cerr << '}'; }
void __print(const string &x) { cerr << '"' << x << '"'; }
void __print(const char *x) { cerr << '"' << x << '"'; }
void __print(char x) { cerr << '\'' << x << '\''; }
void __print(bool x) { cerr << (x ? "true" : "false"); }
template <class T> void __print(const T &x) {
    if constexpr (is_iterable<T>::value) { int f = 0; cerr << '{'; for (const auto &i : x) cerr << (f++ ? ", " : ""), __print(i); cerr << '}'; }
    else cerr << x;
}
void _print() { cerr << "]\n"; }
template <class T, class... V> void _print(const T &t, const V &...v) { __print(t); if (sizeof...(v)) cerr << ", "; _print(v...); }
#define dbg(x...) cerr << "\e[91m" << __func__ << ":" << __LINE__ << " [" << #x << "] = ["; _print(x); cerr << "\e[39m" << flush
#define timer() cerr << "\e[91m" << 1000.0 * clock() / CLOCKS_PER_SEC << " ms\e[39m\n"
#else
#define dbg(x...)
#define timer()
#endif

void solve() {
    
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int t = 1;
    cin >> t;
    while (t--) solve();

    return 0;
}
]==]

local PYTHON_TEMPLATE = [==[
import sys
from bisect import bisect_left, bisect_right, insort
from collections import Counter, defaultdict, deque
from functools import cache, lru_cache, reduce
from heapq import heapify, heappop, heappush
from itertools import accumulate, combinations, permutations, product
from math import ceil, comb, gcd, inf, isqrt, lcm, log2

input = lambda: sys.stdin.readline().rstrip("\r\n")
MOD = 10**9 + 7

# Deep recursion? Run main() on a thread with a big stack instead of raising
# the limit alone -- CPython segfaults before setrecursionlimit saves you:
#   import threading
#   sys.setrecursionlimit(1 << 25)
#   threading.stack_size(1 << 27)
#   threading.Thread(target=main).start()


def ii():
    return int(input())


def mi():
    return map(int, input().split())


def li():
    return list(map(int, input().split()))


def si():
    return input()


def solve():
    pass


def main():
    t = ii()  # single-test problem? replace with: t = 1
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

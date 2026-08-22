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
constexpr int dx[] = {1, -1, 0, 0, 1, 1, -1, -1};
constexpr int dy[] = {0, 0, 1, -1, 1, -1, 1, -1};

mt19937_64 rng(chrono::steady_clock::now().time_since_epoch().count());

namespace fio {
constexpr int ISZ = 1 << 16, OSZ = 1 << 16;
char ibuf[ISZ], obuf[OSZ];
int ipos = 0, ilen = 0, opos = 0;
inline char gc() {
    if (ipos == ilen) {
        ilen = (int)fread(ibuf, 1, ISZ, stdin);
        ipos = 0;
        if (ilen <= 0) return 0;
    }
    return ibuf[ipos++];
}
inline void flushout() {
    if (opos) fwrite(obuf, 1, opos, stdout), opos = 0;
}
inline void pc(char c) {
    if (opos == OSZ) flushout();
    obuf[opos++] = c;
}
struct Flusher {
    ~Flusher() { flushout(); }
} flusher_;
}

using fio::flushout;
using fio::gc;
using fio::pc;

template <class T> inline void rdi(T &x) {
    x = 0;
    char c = gc();
    bool neg = false;
    while (c && c != '-' && (c < '0' || c > '9')) c = gc();
    if (c == '-') neg = true, c = gc();
    while (c >= '0' && c <= '9') x = x * 10 + (c - '0'), c = gc();
    if (neg) x = -x;
}
inline void rd(int &x) { rdi(x); }
inline void rd(long &x) { rdi(x); }
inline void rd(ll &x) { rdi(x); }
inline void rd(lll &x) { rdi(x); }
inline void rd(unsigned &x) { rdi(x); }
inline void rd(unsigned long &x) { rdi(x); }
inline void rd(ull &x) { rdi(x); }
inline void rd(char &c) {
    c = gc();
    while (c && c <= ' ') c = gc();
}
inline void rd(string &s) {
    s.clear();
    char c = gc();
    while (c && c <= ' ') c = gc();
    while (c > ' ') s += c, c = gc();
}
inline void rd(double &x) {
    string s;
    rd(s);
    x = strtod(s.c_str(), nullptr);
}
inline void rd(ld &x) {
    string s;
    rd(s);
    x = strtold(s.c_str(), nullptr);
}
template <class A, class B> inline void rd(pair<A, B> &p) { rd(p.first), rd(p.second); }
template <class T> inline void rd(vector<T> &v) { for (auto &x : v) rd(x); }
template <class T, class U, class... A> inline void rd(T &x, U &y, A &...a) { rd(x), rd(y, a...); }

template <class T> inline void wtu(T x) {
    char buf[48];
    int n = 0;
    do buf[n++] = char('0' + int(x % 10)), x /= 10; while (x);
    while (n) pc(buf[--n]);
}
inline void wt(char c) { pc(c); }
inline void wt(bool b) { pc(b ? '1' : '0'); }
inline void wt(unsigned x) { wtu(x); }
inline void wt(unsigned long x) { wtu(x); }
inline void wt(ull x) { wtu(x); }
inline void wt(ulll x) { wtu(x); }
inline void wt(int x) { if (x < 0) pc('-'), wtu(0u - (unsigned)x); else wtu((unsigned)x); }
inline void wt(long x) { if (x < 0) pc('-'), wtu(0ul - (unsigned long)x); else wtu((unsigned long)x); }
inline void wt(ll x) { if (x < 0) pc('-'), wtu(0ull - (ull)x); else wtu((ull)x); }
inline void wt(lll x) { if (x < 0) pc('-'), wtu(-(ulll)x); else wtu((ulll)x); }
inline void wt(const char *s) { while (*s) pc(*s++); }
inline void wt(const string &s) { for (char c : s) pc(c); }
inline void wt(double x) {
    char buf[512];
    int n = snprintf(buf, sizeof(buf), "%.12f", x);
    n = min(n, (int)sizeof(buf) - 1);
    for (int i = 0; i < n; ++i) pc(buf[i]);
}
inline void wt(ld x) {
    char buf[512];
    int n = snprintf(buf, sizeof(buf), "%.12Lf", x);
    n = min(n, (int)sizeof(buf) - 1);
    for (int i = 0; i < n; ++i) pc(buf[i]);
}
template <class A, class B> inline void wt(const pair<A, B> &p) { wt(p.first), pc(' '), wt(p.second); }
template <class T> inline void wt(const vector<T> &v) {
    for (size_t i = 0; i < v.size(); ++i) {
        if (i) pc(' ');
        wt(v[i]);
    }
}
template <class T, class U, class... A> inline void wt(const T &x, const U &y, const A &...a) { wt(x), pc(' '), wt(y, a...); }
inline void print() { pc('\n'); }
template <class... A> inline void print(const A &...a) { wt(a...), pc('\n'); }

template <int MD> struct Mint {
    int v;
    Mint() : v(0) {}
    Mint(ll x) { v = int(x % MD); if (v < 0) v += MD; }
    Mint &operator+=(const Mint &o) { if ((v += o.v) >= MD) v -= MD; return *this; }
    Mint &operator-=(const Mint &o) { if ((v -= o.v) < 0) v += MD; return *this; }
    Mint &operator*=(const Mint &o) { v = int((ll)v * o.v % MD); return *this; }
    Mint pow(ll e) const { Mint r = 1, b = *this; for (; e > 0; e >>= 1, b *= b) if (e & 1) r *= b; return r; }
    Mint inv() const { return pow(MD - 2); }
    Mint &operator/=(const Mint &o) { return *this *= o.inv(); }
    Mint operator-() const { return Mint(0) -= *this; }
    friend Mint operator+(Mint a, const Mint &b) { return a += b; }
    friend Mint operator-(Mint a, const Mint &b) { return a -= b; }
    friend Mint operator*(Mint a, const Mint &b) { return a *= b; }
    friend Mint operator/(Mint a, const Mint &b) { return a /= b; }
    friend bool operator==(const Mint &a, const Mint &b) { return a.v == b.v; }
    friend bool operator!=(const Mint &a, const Mint &b) { return a.v != b.v; }
    friend ostream &operator<<(ostream &os, const Mint &a) { return os << a.v; }
};
typedef Mint<MOD> mint;
typedef vector<mint> vm;
template <int MD> inline void wt(const Mint<MD> &a) { wt(a.v); }
template <int MD> inline void rd(Mint<MD> &a) { ll x; rd(x); a = Mint<MD>(x); }

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
    size_t operator()(const pair<ull, ull> &p) const {
        return splitmix64(operator()(p.first) * 0x9e3779b97f4a7c15ULL + operator()(p.second));
    }
};

template <class K, class V> using hmap = gp_hash_table<K, V, custom_hash>;
template <class K> using hset = gp_hash_table<K, null_type, custom_hash>;
template <class K, class V> using umap = unordered_map<K, V, custom_hash>;
template <class K> using uset = unordered_set<K, custom_hash>;
template <class T> using min_heap = priority_queue<T, vector<T>, greater<T>>;
template <class T> using max_heap = priority_queue<T>;

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
#define rep(i, a, b) for (int i = (a); i < (b); ++i)
#define per(i, a, b) for (int i = (b) - 1; i >= (a); --i)
#define trav(x, c) for (auto &x : (c))
#define uniq(x) sort(all(x)), (x).erase(unique(all(x)), (x).end())
#define popcnt(x) __builtin_popcountll((ull)(x))
#define ctz(x) __builtin_ctzll((ull)(x))
#define clz(x) __builtin_clzll((ull)(x))
#define bits(x) ((x) ? 64 - __builtin_clzll((ull)(x)) : 0)
#define lowbit(x) ((x) & -(x))
#define yes print("YES")
#define no print("NO")
#define display(x) print(x)

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

ostream &operator<<(ostream &os, lll x) {
    if (x == 0) return os << '0';
    if (x < 0) os << '-', x = -x;
    string s;
    while (x > 0) s += char('0' + int(x % 10)), x /= 10;
    reverse(s.begin(), s.end());
    return os << s;
}

template <class T> istream &operator>>(istream &is, vector<T> &v) {
    for (auto &x : v) is >> x;
    return is;
}
template <class T> ostream &operator<<(ostream &os, const vector<T> &v) {
    for (size_t i = 0; i < v.size(); ++i) os << v[i] << " \n"[i + 1 == v.size()];
    return os;
}

void setIO(const string &name = "") {
    if (!name.empty()) {
        (void)!freopen((name + ".in").c_str(), "r", stdin);
        (void)!freopen((name + ".out").c_str(), "w", stdout);
    }
}

void __print(int x) { cerr << x; }
void __print(long x) { cerr << x; }
void __print(ll x) { cerr << x; }
void __print(unsigned x) { cerr << x; }
void __print(unsigned long x) { cerr << x; }
void __print(ull x) { cerr << x; }
void __print(lll x) { cerr << x; }
void __print(float x) { cerr << x; }
void __print(double x) { cerr << x; }
void __print(ld x) { cerr << x; }
void __print(char x) { cerr << '\'' << x << '\''; }
void __print(const char *x) { cerr << '"' << x << '"'; }
void __print(const string &x) { cerr << '"' << x << '"'; }
void __print(bool x) { cerr << (x ? "true" : "false"); }
template <int MD> void __print(const Mint<MD> &x) { cerr << x.v; }
template <class T, class V> void __print(const pair<T, V> &x);
template <class T> void __print(const T &x) {
    int f = 0;
    cerr << '{';
    for (auto &i : x) cerr << (f++ ? ", " : ""), __print(i);
    cerr << '}';
}
template <class T, class V> void __print(const pair<T, V> &x) {
    cerr << '{';
    __print(x.first);
    cerr << ", ";
    __print(x.second);
    cerr << '}';
}
void _print() { cerr << "]\n"; }
template <class T, class... V> void _print(T t, V... v) {
    __print(t);
    if (sizeof...(v)) cerr << ", ";
    _print(v...);
}
#ifdef DEBUG
#define dbg(x...) cerr << "\e[91m" << __func__ << ":" << __LINE__ << " [" << #x << "] = ["; _print(x); cerr << "\e[39m" << endl;
#define timer() cerr << "\e[91m" << 1000.0 * clock() / CLOCKS_PER_SEC << " ms\e[39m" << endl
#else
#define dbg(x...)
#define timer()
#endif

void solve() {

}

int main() {

    int t = 1; rd(t);
    while (t--)
    solve();

    return 0;
}
]==]

local PYTHON_TEMPLATE = [==[
import sys
from bisect import bisect_left, bisect_right, insort
from collections import Counter, defaultdict, deque
from functools import lru_cache
from heapq import heapify, heappop, heappush
from itertools import accumulate, combinations, permutations
from math import comb, gcd, inf, isqrt, lcm

input = sys.stdin.readline

# Deep recursion? Run main() on a thread with a big stack instead of raising
# the limit alone -- CPython segfaults before setrecursionlimit saves you:
#   sys.setrecursionlimit(1 << 20)
#   threading.stack_size(1 << 27)
#   threading.Thread(target=main).start()


def ii():
    return int(input())


def mi():
    return map(int, input().split())


def li():
    return list(map(int, input().split()))


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

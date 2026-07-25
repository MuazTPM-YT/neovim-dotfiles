return {
  s("!cp", {
    t({
      "#include <bits/stdc++.h>",
      "#include <cmath>",
      "#include <algorithm>",
      "#include <string>",
      "using namespace std;",
      "",
      "typedef long long ll;",
      "",
      "int main(){",
      "  ios::sync_with_stdio(0);",
      "  cin.tie(0);",
      "",
      "  ", -- Indentation for the cursor
    }),
    i(0), -- Cursor will be placed here
    t({
      "",
      "  return 0;",
      "}",
    }),
  }, {
    description = "Inserts C++ competitive programming boilerplate",
  }),
}

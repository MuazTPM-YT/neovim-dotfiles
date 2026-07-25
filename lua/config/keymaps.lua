local opts = { silent = true, noremap = true }

vim.keymap.set("n", "w", "k", opts)
vim.keymap.set("n", "a", "h", opts)
vim.keymap.set("n", "s", "j", opts)
vim.keymap.set("n", "d", "l", opts)

vim.keymap.set("v", "w", "k", opts)
vim.keymap.set("v", "a", "h", opts)
vim.keymap.set("v", "s", "j", opts)
vim.keymap.set("v", "d", "l", opts)

vim.keymap.set("n", "A", "b", opts)
vim.keymap.set("n", "D", "w", opts)
-- NOTE: `k` is claimed below as `^` (line-start). Word-end is on `K` -> `E`.

vim.keymap.set("n", "J", "B", opts)
vim.keymap.set("n", "L", "W", opts)
vim.keymap.set("n", "K", "E", opts)

vim.keymap.set("v", "A", "b", opts)
vim.keymap.set("v", "D", "w", opts)
vim.keymap.set("v", "k", "e", opts)

vim.keymap.set("v", "J", "B", opts)
vim.keymap.set("v", "L", "W", opts)
vim.keymap.set("v", "K", "E", opts)

vim.keymap.set("n", "j", "0", opts)
vim.keymap.set("n", "k", "^", opts)
vim.keymap.set("n", "l", "$", opts)
vim.keymap.set("v", "j", "0", opts)
vim.keymap.set("v", "k", "^", opts)
vim.keymap.set("v", "l", "$", opts)

vim.keymap.set("n", "W", "{", opts)
vim.keymap.set("n", "S", "}", opts)
vim.keymap.set("v", "W", "{", opts)
vim.keymap.set("v", "S", "}", opts)

vim.keymap.set("n", "<C-d>", "yyp", opts)

vim.keymap.set("v", "x", "d", opts)
vim.keymap.set("n", "<C-x>", "dd", opts)
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)

vim.keymap.set("n", "h", "%", opts)
vim.keymap.set("v", "h", "%", opts)
vim.keymap.set("n", "q", "i", opts)
vim.keymap.set("n", "e", "a", opts)
vim.keymap.set("n", "Q", "I", opts)
vim.keymap.set("n", "E", "A", opts)

vim.keymap.set("n", "<leader>D", "D", opts)
vim.keymap.set("n", "<leader>dw", "dw", opts)
vim.keymap.set("n", "<leader>daw", "daw", opts)
vim.keymap.set("n", "<leader>das", "das", opts)
vim.keymap.set("n", "<leader>dap", "dap", opts)

-- NOTE: `]t` / `[t` are defined in lua/plugins/todo-comments.lua, next to the setup.

vim.keymap.set("v", '"', 'c""<Esc>P', opts)
vim.keymap.set("v", "'", "c''<Esc>P", opts)
vim.keymap.set("v", "(", "c()<Esc>P", opts)
vim.keymap.set("v", "[", "c[]<Esc>P", opts)
vim.keymap.set("v", "{", "c{}<Esc>P", opts)

vim.keymap.set("n", "<leader>ui", function()
  local id = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1)
  if id == 0 then
    vim.print("No highlight group under cursor.")
    return
  end
  local name = vim.fn.synIDattr(id, "name")
  local trans_name = vim.fn.synIDattr(vim.fn.synIDtrans(id), "name")
  vim.print(string.format("Highlight group: %s -> links to: %s", name, trans_name))
end, { desc = "Inspect UI Highlight Group" })

-- Debug build: sanitizers + libstdc++ assertions. Slow on purpose -- it catches
-- UB and out-of-bounds before the judge does. Use testcasevim's release mode
-- (<C-Right>) when you actually need to measure runtime.
vim.keymap.set("n", "<leader>a", function()
  if vim.bo.filetype ~= "cpp" then
    vim.notify("<leader>a: not a C++ buffer", vim.log.levels.WARN)
    return
  end

  -- Compile what's on screen, not the last thing that happened to be saved.
  vim.cmd("silent! write")

  local src = vim.fn.shellescape(vim.fn.expand("%:p"))
  local bin = vim.fn.shellescape(vim.fn.expand("%:p:r"))
  local cmd = table.concat({
    "g++ -std=c++17 -O2 -g -DDEBUG",
    "-Wall -Wextra -Wshadow",
    "-fsanitize=address,undefined -D_GLIBCXX_DEBUG",
    src,
    "-o",
    bin,
    '&& echo "--- compiled, running ---" &&',
    bin,
  }, " ")

  vim.cmd("botright split")
  vim.cmd("resize 15")
  vim.cmd("enew")
  vim.fn.jobstart({ "sh", "-c", cmd }, { term = true })
  vim.cmd("startinsert") -- stdin goes straight to the program
end, { desc = "Compile and run C++ file (debug build)" })

vim.keymap.set("n", "<C-Left>", '<Cmd>lua require("testcasevim").set_debug()<CR>', opts)
vim.keymap.set("n", "<C-Right>", '<Cmd>lua require("testcasevim").set_release()<CR>', opts)

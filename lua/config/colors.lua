-- Theme switching.
--   :Theme          picker with live preview (dark themes only)
--   :Theme <name>   apply a theme, <Tab> completes
-- The last theme applied is remembered across restarts.

local M = {}

local DEFAULT = "rose-pine"
local STATE_FILE = vim.fn.stdpath("state") .. "/colorscheme"

-- Every dark colorscheme the plugins in lua/plugins/colors.lua provide.
M.dark = {
  "ayu-dark", "ayu-mirage",
  "bamboo", "bamboo-multiplex", "bamboo-vulgaris",
  "brightburn",
  "carbonfox", "duskfox", "nightfox", "nordfox", "terafox",
  "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
  "cyberdream",
  "doom-one",
  "dracula", "dracula-soft",
  "edge",
  "eldritch",
  "embark",
  "everblush",
  "everforest",
  "flexoki-dark",
  "github_dark", "github_dark_default", "github_dark_dimmed", "github_dark_high_contrast", "github_dark_tritanopia",
  "gruvbox",
  "gruvbox-material",
  "jellybeans",
  "kanagawa-dragon", "kanagawa-wave",
  "kanagawa-paper-ink",
  "lackluster", "lackluster-hack", "lackluster-mint",
  "material-darker", "material-deep-ocean", "material-oceanic", "material-palenight",
  "melange",
  "mellow",
  "miasma",
  "midnight",
  "modus_vivendi",
  "monokai-pro", "monokai-pro-classic", "monokai-pro-machine", "monokai-pro-octagon", "monokai-pro-ristretto", "monokai-pro-spectrum",
  "moonfly",
  "neofusion",
  "night-owl",
  "nightfly",
  "nord",
  "nordic",
  "oldworld",
  "onedark", "onedark_dark", "onedark_vivid",
  "onenord",
  "oxocarbon",
  "poimandres",
  "rose-pine-main", "rose-pine-moon",
  "solarized-osaka",
  "sonokai",
  "tokyodark",
  "tokyonight-moon", "tokyonight-night", "tokyonight-storm",
  "vague",
  "vesper",
  "vscode",
}

local is_dark = {}
for _, name in ipairs(M.dark) do
  is_dark[name] = true
end

-- Groups that must show the terminal background, whatever the theme does.
local CLEAR_BG = {
  "Normal", "NormalNC", "NormalFloat", "FloatBorder", "FloatTitle", "FloatFooter",
  "SignColumn", "FoldColumn", "LineNr", "CursorLineNr", "EndOfBuffer", "WinSeparator", "VertSplit",
  "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "WinBar", "WinBarNC", "MsgArea",
  "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal", "TelescopePromptBorder",
  "BufferLineFill", "BufferLineBackground",
  "SnacksNormal", "SnacksNormalNC", "SnacksPicker", "SnacksPickerBorder",
  "WhichKeyNormal", "WhichKeyBorder", "LazyNormal", "MasonNormal", "NoiceCmdlinePopup",
}

-- White, non-blinking block in every mode. Some themes (doom-one, material)
-- overwrite 'guicursor', so both are re-applied after every theme.
local GUICURSOR = "a:block-Cursor/lCursor-blinkon0"

local function cursor()
  vim.o.guicursor = GUICURSOR
  for _, group in ipairs({ "Cursor", "lCursor", "TermCursor" }) do
    vim.api.nvim_set_hl(0, group, { fg = "#000000", bg = "#ffffff" })
  end
end

local function transparent()
  for _, group in ipairs(CLEAR_BG) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg, hl.ctermbg = nil, nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end

--- Apply a colorscheme. Returns false (and warns) when it does not exist.
function M.apply(name)
  local ok, err = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify(("Theme %q failed: %s"):format(name, err), vim.log.levels.ERROR)
  end
  return ok
end

--- Startup: the saved theme, else the default, else a built-in.
function M.load()
  local ok, saved = pcall(vim.fn.readfile, STATE_FILE)
  local name = ok and saved[1] or DEFAULT
  if not (pcall(vim.cmd.colorscheme, name) or pcall(vim.cmd.colorscheme, DEFAULT)) then
    vim.cmd.colorscheme("habamax")
  end
end

--- Picker with live preview, limited to the dark list.
function M.pick()
  Snacks.picker.colorschemes({
    layout = "ivy",
    transform = function(item)
      return is_dark[item.text] == true
    end,
  })
end

local group = vim.api.nvim_create_augroup("ThemeSwitch", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = function(args)
    transparent()
    cursor()
    pcall(vim.fn.writefile, { args.match }, STATE_FILE)
  end,
})

vim.api.nvim_create_user_command("Theme", function(opts)
  if opts.args == "" then
    M.pick()
  else
    M.apply(opts.args)
  end
end, {
  nargs = "?",
  desc = "Switch colorscheme (no argument: picker)",
  complete = function(lead)
    return vim.tbl_filter(function(name)
      return vim.startswith(name, lead)
    end, M.dark)
  end,
})

return M

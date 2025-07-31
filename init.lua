-- bootstrap lazy.nvim, LazyVim and your plugins

vim.opt.termguicolors = true
vim.g.lazyvim_check_order = false
vim.g.mapleader = " "
require("config.lazy")

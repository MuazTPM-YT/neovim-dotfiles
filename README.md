# 💫 My Neovim Configuration

![Neovim Version](https://img.shields.io/badge/Neovim-0.10+-blueviolet?style=for-the-badge&logo=neovim)
![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/MuazTPM-YT/neovim-dotfiles?style=for-the-badge)

Welcome to my personal Neovim setup! This repository contains all the configuration files to get my development environment up and running quickly. It's tailored for `TypeScript, Rust, Python, C++, C, and general web development]`, aiming for a balance between aesthetics, performance, and functionality.

## 📂 Directory Structure

My configuration is structured to be modular and easy to navigate.

```
~/.config/nvim
├── init.lua                -- Main entry point
├── lua/
│   ├── config/             -- Main configuration entry
│   │   ├── lazy.lua        -- Lazy.nvim setup
│   │   └── options.lua     -- Global Neovim options
│   ├── core/
│   │   ├── keymaps.lua     -- Global keybindings
│   │   └── autocmds.lua    -- Global autocommands
│   └── plugins/
│       ├── [plugin-name].lua -- Configuration for each plugin
│       ├── ...
│       └── lsp.lua         -- LSP server configurations
└── ...
```

***

## 🙏 Credits & Inspiration

This configuration wouldn't be possible without the amazing work of the Neovim community.

* This setup is built upon the excellent [LazyVim](https://www.lazyvim.org/) starter template.
* The creators of `lazy.nvim`, `telescope.nvim`, and `nvim-treesitter`.
* `[Add any other repos or creators that inspired you]`

***

## 📄 License

This project is licensed under the **Apache License 2.0**. You can find the full license text in the [LICENSE](LICENSE) file.

# 💫 My Neovim Configuration

![Neovim Version](https://img.shields.io/badge/Neovim-0.10+-blueviolet?style=for-the-badge&logo=neovim)
![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/your-username/your-repo-name?style=for-the-badge)

Welcome to my personal Neovim setup! This repository contains all the configuration files to get my development environment up and running quickly. It's tailored for `[mention your primary languages, e.g., TypeScript, Rust, Go, and general web development]`, aiming for a balance between aesthetics, performance, and functionality.

![image](https://github.com/user-attachments/assets/9144853b-e9b2-4f1b-a579-3738e4040e34)

***

## ✨ Features

* **Plugin Manager**: Uses [`lazy.nvim`](https://github.com/folke/lazy.nvim) for lightning-fast startup and easy plugin management.
* **Aesthetics**: A clean and modern look using `[Your Theme, e.g., Catppuccin, Tokyonight]` with a custom `lualine` statusbar.
* **LSP & Autocompletion**: Full-featured code intelligence with `nvim-lspconfig` and `nvim-cmp`.
* **Fuzzy Finding**: Blazing fast file, buffer, and text searching with [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim).
* **Git Integration**: Seamless git integration within the editor via [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim).
* **File Explorer**: A familiar and powerful file tree with [`nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua).
* **Syntax Highlighting**: Enhanced and accurate highlighting with [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter).
* **Keymap Helper**: Discover keybindings easily with [`which-key.nvim`](https://github.com/folke/which-key.nvim).
* `[Add any other special features you've configured]`

***

## 🔧 Prerequisites

Before you begin, ensure you have the following installed:

1.  **Neovim**: Version `0.10` or higher.
    ```sh
    # Example for macOS
    brew install neovim
    ```
2.  **Git**: For cloning this repository and managing plugins.
3.  **A Nerd Font**: Required for icons to render correctly. I recommend `[Your Font, e.g., FiraCode Nerd Font, JetBrainsMono Nerd Font]`.
    * Download from the [Nerd Fonts Website](https://www.nerdfonts.com/font-downloads) and set it as your terminal's font.
4.  **Build Tools**: Required by some plugins.
    ```sh
    # Example for Debian/Ubuntu
    sudo apt-get install build-essential

    # Example for macOS
    xcode-select --install
    ```
5.  **External Dependencies**: For `telescope.nvim` and other tools.
    ```sh
    # ripgrep for searching, fd for finding files
    brew install ripgrep fd
    # or
    sudo apt-get install ripgrep fd-find
    ```

***

## 🚀 Installation

**Warning:** The following commands will replace your existing Neovim configuration. Please back it up first!

1.  **Backup your current Neovim config**:
    ```sh
    # Make a backup of your current nvim config
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    mv ~/.local/state/nvim ~/.local/state/nvim.bak
    mv ~/.cache/nvim ~/.cache/nvim.bak
    ```
2.  **Clone this repository**:
    ```sh
    git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git) ~/.config/nvim
    ```
3.  **Launch Neovim**:
    ```sh
    nvim
    ```
    The `lazy.nvim` plugin manager will automatically start installing all the plugins. This might take a few minutes. Once it's done, restart Neovim to ensure everything is loaded correctly.

***

## ⌨️ Keybindings

My leader key is set to `Space`. Pressing `<Space>` in Normal mode will pop up a `which-key` window showing available commands.

Here are some of the most common keybindings:

| Keybinding          | Action                                       |
| ------------------- | -------------------------------------------- |
| `<leader>ff`        | Find files (`Telescope`)                     |
| `<leader>fg`        | Live grep for text in files (`Telescope`)    |
| `<leader>fb`        | Find open buffers (`Telescope`)              |
| `<leader>fh`        | Find help tags (`Telescope`)                 |
| `<leader>e`         | Toggle file explorer (`nvim-tree`)           |
| `<leader>w`         | Write (save) the current file                |
| `<leader>q`         | Quit the current buffer                      |
| `gd`                | Go to definition (`LSP`)                     |
| `gr`                | Go to references (`LSP`)                     |
| `K`                 | Show hover documentation (`LSP`)             |
| `[d` / `]d`         | Go to previous/next diagnostic               |
| `<C-h/j/k/l>`       | Navigate between `tmux`/`vim` panes             |
| `[Add your other custom keybindings here]` | `[Describe the action]` |

***

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

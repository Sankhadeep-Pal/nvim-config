# ⚡ Neovim Configuration

A clean, blazing-fast, and modern Neovim setup built with **Lua** and **Lazy.nvim**, tailored for low-level systems programming (C, C++, Rust, Assembly) and general software development.

---

## ✨ Features

*   **Package Management:** Powered by [lazy.nvim](https://github.com/folke/lazy.nvim) for rapid, on-demand plugin loading.
*   **Language Server Protocol (LSP):** Native Neovim 0.11+ LSP integration with [Mason](https://github.com/williamboman/mason.nvim) for seamless language server management (`clangd`, `rust-analyzer`, `gopls`, `lua_ls`, etc.).
*   **Syntax & Parsing:** Advanced syntax highlighting, indentation, and sticky context via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
*   **Buffer & Status Line:** Pinned global statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) and clickable tabs via [bufferline.nvim](https://github.com/akinsho/bufferline.nvim).
*   **File Management:** Minimal buffer-like filesystem navigation using [oil.nvim](https://github.com/stevearc/oil.nvim).
*   **Embedded Terminal:** Floating and split terminal management with [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim).
*   **Interactive Helper:** Command discovery and keymap menu via [which-key.nvim](https://github.com/folke/which-key.nvim).
*   **Autocomplete & Snippets:** Intelligent completion using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
*   **Theme:** Minimal and high-contrast [Catppuccin](https://github.com/catppuccin/nvim).

---

## 📂 Project Structure

    ~/.config/nvim/
    ├── init.lua
    └── lua/
        ├── config/
        │   ├── autocmds.lua     # Global autocommands
        │   ├── keymaps.lua      # Core keybindings
        │   ├── lazy.lua         # Lazy.nvim bootstrapping
        │   └── options.lua      # Editor settings (indentation, cmdheight, mouse, etc.)
        └── plugins/
            ├── autoPairs.lua    # Automatic bracket/quote closing
            ├── bufferLine.lua   # Buffer tabs and click actions
            ├── completion.lua   # nvim-cmp autocompletion engine
            ├── dashboard.lua    # Startup dashboard (snacks.nvim)
            ├── fileManager.lua  # Oil.nvim file manager
            ├── formatting.lua   # Code formatting integration
            ├── functionLine.lua # Scope lines & sticky context
            ├── icon.lua         # Mini.icons / devicons
            ├── lsp.lua          # Native LSP configurations & keymaps
            ├── luaLine.lua      # Pinned global statusline & showcmd
            ├── mason.lua        # LSP, Linter & Formatter installer
            ├── snippets.lua     # Snippet expansion engine
            ├── terminal.lua     # ToggleTerm configuration
            ├── theme.lua        # Theme setup (Catppuccin)
            ├── treesitter.lua   # Treesitter grammar parsers
            └── whichKey.lua     # Keybinding menu & spell helpers

---

## 📋 Prerequisites

*   **Neovim** $\ge$ `v0.10.0` (Recommended: `v0.11+`)
*   **Git**
*   A **[Nerd Font](https://www.nerdfonts.com/)** (e.g., JetBrains Mono Nerd Font, FiraCode Nerd Font)
*   **C/C++ Compiler Toolchain** (`gcc`, `clang`, `make`)
*   **Node.js** & **npm** (Required by Mason for specific LSPs/formatters)
*   **Ripgrep** & **FD** (Recommended for fuzzy searching)

---

## 🚀 Installation

1.  **Back up your existing configuration (optional):**
    ```bash
    mv ~/.config/nvim ~/.config/nvim.backup
    mv ~/.local/share/nvim ~/.local/share/nvim.backup
    mv ~/.local/state/nvim ~/.local/state/nvim.backup
    mv ~/.cache/nvim ~/.cache/nvim.backup
    ```

2.  **Clone this repository:**
    ```bash
    git clone https://github.com/Sankhadeep-Pal/nvim-config.git ~/.config/nvim
    ```

3.  **Launch Neovim:**
    ```bash
    nvim
    ```
    *Lazy.nvim will automatically bootstrap and install all configured plugins on the first run.*

---

## ⌨️ Key Bindings Overview

*The leader key is mapped to `Space`.*

### Core & Navigation
| Key | Action |
| :--- | :--- |
| `<leader>e` | Open File Explorer (Oil) |
| `<Tab>` | Switch to Next Buffer |
| `<S-Tab>` | Switch to Previous Buffer |
| `<leader>x` | Close Current Buffer |
| `<C-/>` or `<C-_>` | Toggle Line Comment |

### LSP & Code Intelligence
| Key | Action |
| :--- | :--- |
| `gd` | Go to Definition |
| `gD` | Go to Declaration |
| `gr` | Find References |
| `K` | Hover Documentation |
| `<leader>ca` | Code Action |
| `<leader>rn` | Rename Symbol |
| `<leader>d` | Open Line Diagnostics |
| `[d` / `]d` | Previous / Next Diagnostic |

### Terminal & Tools
| Key | Action |
| :--- | :--- |
| `<leader>t` | Toggle Floating Terminal |
| `<leader>th` | Toggle Horizontal Terminal |
| `<leader>tv` | Toggle Vertical Terminal |
| `<leader>s` | Spell Suggestions & Dictionary Menu |

# 🚀 Neovim Configuration

A modern, fast, and highly customizable Neovim configuration based on [LazyVim](https://www.lazyvim.org/) with thoughtfully chosen plugins and optimized keybindings.

Built for maximum productivity with sensible defaults and lightning-fast startup times.

---

## ✨ Features

- **🚀 Blazing Fast** - Optimized lazy loading with caching (startup time < 100ms)
- **🎨 Beautiful UI** - Solarized Osaka theme with smooth colors and modern components
- **🔍 Powerful Search** - Telescope fuzzy finder for files, text, symbols, and more
- **💻 Full LSP Support** - Automatic language server setup via Mason with intelligent completions
- **📝 Advanced Syntax** - Treesitter for accurate highlighting and smart text objects
- **⚡ Smart Editing** - Incremental rename, dial for smart incrementing, and more
- **🖥️ Integrated Terminal** - Floating/split terminals with `jk` to exit
- **🔧 Auto Formatting** - Prettier and Conform for consistent code style
- **📊 Git Integration** - Gitsigns with blame, diffs, and staged hunks
- **🎯 Optimized Keybinds** - Intuitive mappings for vim-like efficiency
- **✅ Web Dev Ready** - TypeScript, React, Tailwind CSS, ESLint support
- **🦀 Polyglot Support** - Rust, Go, Python, Lua, and 30+ languages pre-configured

---

## 📋 System Requirements

### macOS

| Component | Version | Installation |
|-----------|---------|--------------|
| **Neovim** | v0.9.0+ | `brew install neovim` |
| **Git** | Latest | Pre-installed |
| **Zsh** | Latest | Pre-installed |
| **Node.js** | v18+ | `brew install node` |
| **Ripgrep** | Latest | `brew install ripgrep` |
| **fd** | Latest | `brew install fd` |

### Optional: Ghostty Terminal (Recommended) ⭐

For the optimal Neovim experience, use [Ghostty](https://ghostty.org/):

```bash
brew install --cask ghostty
```

**Why Ghostty?**
- 🚀 GPU-accelerated, smooth scrolling
- 🎨 Perfect font and ligature rendering
- 👀 Low-latency typing experience
- 📺 True color (24-bit) and undercurl support
- ⚡ Instant window creation

---

## 🚀 Quick Start

### 1️⃣ Install Dependencies

```bash
# Install Neovim
brew install neovim ripgrep fd node

# (Optional) Install Ghostty
brew install --cask ghostty
```

### 2️⃣ Backup Existing Config

```bash
# Back up your current Neovim config (if you have one)
mv ~/.config/nvim ~/.config/nvim.backup
```

### 3️⃣ Clone Configuration

```bash
git clone https://github.com/naveen-93/nvim.git ~/.config/nvim
cd ~/.config/nvim
```

### 4️⃣ Launch Neovim

```bash
nvim
```

**First Launch Automation:**
- Installs lazy.nvim plugin manager
- Downloads and installs all plugins (2-3 minutes)
- Sets up language servers
- Loads configurations

✅ **That's it!** Your Neovim is ready.

### 5️⃣ Install Language Servers (Optional)

```vim
:Mason
```

Navigate and press `i` to install servers. Or use:

```vim
:MasonInstall typescript-language-server gopls rust-analyzer lua-language-server tailwindcss-language-server
```

---

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point & initialization
├── README.md                   # This file
├── lazy-lock.json              # Plugin version locks
│
└── lua/
    ├── config/
    │   ├── options.lua         # Vim settings (tabs, indentation, UI)
    │   ├── keymaps.lua         # All keybindings & terminal
    │   ├── autocmds.lua        # Autocommands (paste, concealing)
    │   └── lazy.lua            # Plugin manager bootstrap
    │
    ├── plugins/                # Plugin specs (lazy-loaded)
    │   ├── coding.lua          # dial, inc-rename, copilot
    │   ├── colorscheme.lua     # solarized-osaka theme
    │   ├── editor.lua          # telescope, trouble, harpoon
    │   ├── lsp.lua             # mason, lspconfig, servers
    │   ├── treesitter.lua      # syntax, textobjects, context
    │   └── ui.lua              # statusline, bufferline, dashboard
    │
    ├── craftzdog/              # Custom modules (optional)
    │   ├── discipline.lua       # Cowboy mode for hjkl training
    │   ├── hsl.lua             # Color conversion utilities
    │   └── lsp.lua             # LSP helper functions
    │
    └── util/
        └── debug.lua           # Debug utilities (dd function)
```

---

## ⌨️ Essential Keybindings

**Leader Key:** `<Space>`

### 🔍 Finding Things

| Binding | Action |
|---------|--------|
| `;f` | Find files in project |
| `;r` | Live grep (search text) |
| `\\` | Search open buffers |
| `;t` | Search help tags |
| `;e` | Show diagnostics |
| `;s` | Treesitter symbols |
| `sf` | File browser (current dir) |

### 🪟 Window Management

| Binding | Action |
|---------|--------|
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<C-h/j/k/l>` | Focus left/down/up/right |
| `<leader>.` | Widen (+3 cols) |
| `<leader>,` | Narrow (-3 cols) |
| `<leader>]` | Taller (+3 rows) |
| `<leader>[` | Shorter (-3 rows) |
| `<leader>=` | Equalize sizes |

### 📑 Tabs & Buffers

| Binding | Action |
|---------|--------|
| `<leader>tn` | New tab |
| `<leader>tc` | Close tab |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Delete buffer |
| `<leader>to` | Close hidden buffers |
| `<leader>tu` | Close unnamed buffers |

### 🖥️ Terminal

| Binding | Action |
|---------|--------|
| `<C-t>` | Toggle floating terminal |
| `<leader>tv` | Toggle vertical split terminal |
| `<leader>th` | Toggle horizontal split terminal |
| `jk` | Exit terminal (inside terminal) |

### ✏️ Editing

| Binding | Action |
|---------|--------|
| `jk` | Exit insert mode |
| `<leader>w` | Save file |
| `<leader>q` | Quit window |
| `<A-j/k>` | Move line down/up |
| `J` | Join lines (cursor stays) |
| `<leader>d` | Delete without clipboard |
| `<leader>p` | Paste from system clipboard |
| `<leader>y` | Yank to system clipboard |
| `<leader>aa` | Select all |
| `+/-` | Increment/decrement |

### 🧠 Code Navigation & LSP

| Binding | Action |
|---------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | List references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>lf` | Format file |
| `[d / ]d` | Previous/next diagnostic |
| `<leader>de` | Show line diagnostics |

### 🔎 Search & View

| Binding | Action |
|---------|--------|
| `<Esc>` | Clear search highlight |
| `<leader>rw` | Replace word under cursor |
| `n/N` | Next/prev search (centered) |
| `<leader>xx` | Toggle all diagnostics |
| `<leader>z` | Zen mode (distraction-free) |

### 🛠️ Utility

| Binding | Action |
|---------|--------|
| `<leader><leader>` | Reload config file |
| `<leader>X` | Make file executable |

---

## 🔌 Plugin Ecosystem

### Core Navigation
- **telescope.nvim** - Fuzzy finder (files, grep, symbols)
- **harpoon** - Mark and quickly jump to files
- **trouble.nvim** - Better diagnostic display
- **nvim-spectre** - Project-wide find & replace

### Code Intelligence
- **nvim-lspconfig** - LSP client setup
- **mason.nvim** - Language server installer
- **blink.cmp** - Modern completion engine
- **nvim-treesitter** - Syntax highlighting & text objects
- **conform.nvim** - Code formatting
- **nvim-lint** - Code linting

### Code Understanding
- **nvim-treesitter-context** - Show scope/context info
- **rainbow-delimiters.nvim** - Colorize brackets
- **nvim-ts-autotag** - Auto-close HTML tags
- **inc-rename.nvim** - Live rename previews

### User Interface
- **noice.nvim** - Beautiful command line
- **lualine.nvim** - Statusline with git info
- **bufferline.nvim** - Tab bar
- **incline.nvim** - Floating filename
- **snacks.nvim** - Dashboard & utilities
- **zen-mode.nvim** - Distraction-free mode
- **indent-blankline.nvim** - Indent guides

### Git & Version Control
- **gitsigns.nvim** - Git signs, blame, diffs
- **git.nvim** - Git commands & browsing

### Smart Tools
- **dial.nvim** - Smart increment/decrement
- **copilot.lua** - GitHub Copilot integration
- **crates.nvim** - Rust crate management

### Appearance
- **solarized-osaka.nvim** - Beautiful warm theme

---

## 🎯 Quick Tips

### Use Harpoon for Fast Navigation
```vim
<leader>ha         " Mark current file
<leader>hh         " Show marked files menu
<leader>h1-4       " Jump to marks 1-4
```

### Project-wide Find & Replace
```vim
<leader>sr         " Open Spectre
<leader>sw         " Search word under cursor
```

### View All Diagnostics
```vim
<leader>xx         " Trouble: show all diagnostics
<leader>xw         " Trouble: buffer diagnostics
```

### Distraction-Free Coding
```vim
<leader>z          " Enter Zen Mode
```

### Search Across Project
```vim
;r                 " Live grep (respects .gitignore)
<leader>rw         " Replace word
```

---

## ⚙️ Customization

### Change Keybindings

Edit `lua/config/keymaps.lua`:

```lua
-- Example: Add custom mapping
map("n", "<leader>co", "<cmd>Copilot chat<cr>", "Copilot chat")
```

### Add Language Servers

In `lua/plugins/lsp.lua`, add to `ensure_installed`:

```lua
vim.list_extend(opts.ensure_installed, {
    "rust-analyzer",
    "gopls",
    "python-lsp-server",
})
```

### Change Theme

In `lua/plugins/colorscheme.lua`:

```lua
{
    "folke/tokyonight.nvim",  -- or any other theme
    lazy = true,
    priority = 1000,
}
```

### Disable Plugins

In `lua/config/lazy.lua`, comment out imports:

```lua
-- { import = "lazyvim.plugins.extras.lang.rust" },
```

### Enable Cowboy Mode

In `init.lua`, uncomment:

```lua
require("craftzdog.discipline").cowboy()
```

This warns when you repeatedly press hjkl to encourage better vim motions.

---

## 🔧 Troubleshooting

### Plugins not loading?

```bash
rm -rf ~/.local/share/nvim/lazy && nvim
```

### Language server not working?

```vim
:Mason              " Check installation
:LspInfo            " Check attachment
:Lazy               " Reload lazy
```

### Slow startup?

```vim
:Lazy               " Find slow plugins
:ProfileStart
" Use Neovim normally
:ProfileStop
" Find profile in the shown file
```

### Colors wrong?

1. Ensure terminal has true color: `export TERM=xterm-256color`
2. Check terminal supports 24-bit color
3. Try Ghostty terminal

### Keymap not working?

```vim
:verbose map <leader>xx    " Show what's mapped to this
```

---

## 📚 Learning Resources

- [Neovim Docs](https://neovim.io/doc/)
- [LazyVim](https://www.lazyvim.org/)
- [Vim Tips Wiki](https://vim.fandom.com/wiki/Best_Vim_Tips)
- [LSP Guide](https://neovim.io/doc/user/lsp.html)

---

## 📦 Plugin Management

```vim
:Lazy update        " Update all plugins
:Lazy sync          " Clean & update
:Lazy check         " Check for updates
:Lazy clear         " Clear cache
```

---

## 🔄 Backup & Restore

```bash
# Backup
cp -r ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)

# Restore
rm -rf ~/.config/nvim && mv ~/.config/nvim.backup ~/.config/nvim
```

---

## 📝 License

Based on [LazyVim](https://www.lazyvim.org/). Check individual plugins for their licenses.

## 🙏 Credits

- [LazyVim](https://www.lazyvim.org/) - Base framework
- [folke](https://github.com/folke) - Creator of LazyVim and plugins
- [craftzdog](https://github.com/craftzdog) - Solarized Osaka & inspiration
- [neovim](https://neovim.io/) - The best editor

---

**Last Updated:** February 23, 2026  
**Neovim:** v0.9.0+  
**Status:** ✅ Fully Functional

For issues or suggestions: [GitHub](https://github.com/naveen-93/nvim)




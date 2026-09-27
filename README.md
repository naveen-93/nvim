# Neovim Configuration

A [LazyVim](https://github.com/LazyVim/LazyVim) setup with the
[solarized-osaka](https://github.com/craftzdog/solarized-osaka.nvim) colorscheme.

It is very close to a stock LazyVim install — the only real customisations are the
colorscheme and a few Telescope keymaps. Everything else comes from LazyVim, so it is
worth reading the [LazyVim docs](https://lazyvim.github.io) to see what you already have.

---

## Requirements

LazyVim's own health check looks for exactly these commands
(`lua/lazyvim/health.lua:18`), so this table mirrors it:

| Dependency | Notes |
| --- | --- |
| Neovim **>= 0.11.2** built with LuaJIT | Hard requirement |
| `git` | Used by the plugin installer itself |
| `rg` (ripgrep) | Search across files |
| `fd` (or `fdfind`) | Faster file finding |
| `fzf` | Optional fuzzy finding |
| `curl` | Mason downloads language servers with it |
| `lazygit` | Optional; see the note below — the binary alone does nothing |
| C compiler (`cc`) | Compiles Tree-sitter parsers |
| `node` | Only for JS/TS language servers |
| `python3` | Only for Python language servers |

On macOS:

```sh
brew install neovim ripgrep fd fzf lazygit node python
```

Verify any time with `:checkhealth lazyvim`. You do not need all of these — a missing
optional one is a warning, not a failure.

> Upstream prerequisite list:
> [lazyvim.github.io/installation](https://lazyvim.github.io/installation#prerequisites).

---

## Install

This repo *is* the config, so clone it straight into place:

```sh
# 1. Back up any existing config
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null

# 2. Clone
git clone https://github.com/naveen-93/nvim.git ~/.config/nvim
```

That's it — `~/.config/nvim` is a normal git clone, so `git pull` inside it is how you
update both this config and its pinned plugins.

<details>
<summary>Alternative: as a submodule of a larger dotfiles repo</summary>

If you keep all your dotfiles in one repo, add this as a submodule instead of
cloning it separately:

```sh
git submodule add https://github.com/naveen-93/nvim.git ~/.config/nvim
git -C ~/.config/nvim pull   # inside the submodule, never commit from the parent
```

Submodules have a sharp edge: committing from the parent repo records a *commit hash*,
not the files. If you edit config and push from the wrong directory, the parent repo
silently keeps pointing at the old commit. A standalone clone has no such trap, which
is why it's the default here.

</details>

### First launch

Just run it:

```sh
nvim
```

On the very first start, and with no input needed from you, LazyVim will:

- clone all plugins (see `lazy-lock.json` for the exact pinned commits),
- download Tree-sitter parsers for the languages it highlights,
- install `stylua` and `shfmt` through Mason.

Language servers install on demand the first time you open a file of that type. To
install or inspect them yourself, use `<leader>cm` (Mason).

The first launch takes a minute or two. Later starts are fast.

---

## What is customised here

Almost nothing — the point of this section is so you know where to make changes.

| File | What it does |
| --- | --- |
| `lua/config/lazy.lua` | Plugin manager setup, plus four Telescope keymaps at the bottom |
| `lua/plugins/colorscheme.lua` | Loads solarized-osaka |
| `lua/plugins/telescope.lua` | Ensures Telescope + plenary are present |
| `lua/config/keymaps.lua` | Save/quit shortcuts and the vertical-terminal helper |
| `lua/config/autocmds.lua` | **Empty** — add autocmds here |
| `lua/plugins/example.lua` | **Dead file.** Line 3 is `if true then return {} end`, so it always returns nothing. Only useful as a reference. |

### The Telescope keymaps

Appended to the bottom of `lua/config/lazy.lua`:

| Key | Action |
| --- | --- |
| `<C-p>` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |

These shadow LazyVim's stock mappings, which normally open
[snacks.nvim](https://github.com/folke/snacks.nvim). Both plugins stay installed, so
nothing is lost — the snacks pickers for the same three actions live on different keys:

| Action | Telescope (this config) | snacks (still available) |
| --- | --- | --- |
| Find files | `<C-p>` | `<leader>ff` |
| Grep | `<leader>fg` | `<leader>sg` |
| Buffers | `<leader>fb` | `<leader>fB` |
| Help | `<leader>fh` | `<leader>sh` |

Prefer snacks' pickers? Delete lines 55-58 of `lua/config/lazy.lua` and everything
reverts to the LazyVim default.

### The terminal keymaps

`lua/config/keymaps.lua` defines an `open_vertical_terminal(command, cwd)` helper that
splits the window to 45% width, starts `command` in a terminal buffer at `cwd`, and
wires up cleanup — a buffer-local `<C-q>` closes it, and a `TermClose` autocmd removes
the window if the process exits on its own.

| Key | Action | Working directory |
| --- | --- | --- |
| `<leader>tv` | Vertical terminal running your `$SHELL` | current directory |
| `<leader>tc` | Vertical terminal running `codex` | project root |
| `<leader>ta` | Vertical terminal running `claude` | project root |

Both AI tools are checked with `executable()` first, so pressing a key for a tool you
haven't installed shows a notification instead of opening a dead terminal. `codex` is
not on this machine, so `<leader>tc` currently reports that; `claude` is installed and
`<leader>ta` works.

`LazyVim.root()` is what resolves "project root" — it returns the nearest directory
containing `.git`, falling back to the current directory.

### Save and quit

| Key | Action |
| --- | --- |
| `jk` (insert mode) | Exit insert mode |
| `<leader>w` | Write file |
| `<leader>wq` | Write and quit |
| `<leader>q` | Quit |
| `<leader>a` | Quit all |

Two notes, because these override LazyVim's own defaults:

- `<leader>q` normally runs `<cmd>confirm q<cr>`, which asks before discarding changes.
  This config quits immediately. To get the confirmation back, change it to
  `"<cmd>confirm q<cr>"`.
- `<leader>a` is the prefix LazyVim reserves for its AI extras (`copilot-chat`,
  `claudecode`, `sidekick`). No AI extra is enabled here, so `Quit All` works — but
  enabling one of those extras later will collide with it.

What the two overridden group prefixes do by default:

- `<leader>q` is a which-key group for "quit/session". Its children — `<leader>qs`,
  `<leader>qS`, `<leader>ql`, `<leader>qd` and `<leader>qq` — are unaffected and still
  work; only the bare prefix now quits instead of opening the menu.
- `<leader>w` is a which-key group for "windows". It did not have fixed sub-mappings:
  LazyVim builds it dynamically from your currently open windows, and proxies the
  prefix to `<c-w>`. Binding it to `:write` removes that window-picker menu. Window
  navigation itself is untouched, because those live on the raw `<c-w>` keys —
  `<C-h>`, `<C-j>`, `<C-k>` and `<C-l>` are still mapped to `<C-w>h/j/k/l`.

---

## Changing the colorscheme

The colorscheme lives in `lua/plugins/colorscheme.lua`:

```lua
return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = {},
  },

  -- load the colorscheme
  { "LazyVim/LazyVim", opts = { colorscheme = "solarized-osaka" } },
}
```

**A trap worth knowing:** the file must be `lua/plugins/colorscheme.lua`.
Creating `lua/config/colorscheme.lua` does *nothing* — LazyVim only auto-loads
`options.lua`, `keymaps.lua` and `autocmds.lua` from `lua/config/`. A lot of guides
online get this wrong, and the symptom is a silent no-op: the file sits there, the
theme never changes, and nothing errors.

The theme also ships a matching lualine theme. You do not need to wire it up —
LazyVim's default `options.theme = "auto"` makes lualine look for a theme named after
the active colorscheme and finds `solarized-osaka` automatically.

It also ships `-light` and `-vivid` variants:

```sh
nvim --headless "+colorscheme solarized-osaka-light" +qa
```

Add a `lua/plugins/colorscheme.lua` entry if you want one permanently. To browse the
available colorschemes without committing to one, use `<leader>uC`.

---

## Everyday commands

Every mapping below was read out of the running config with
`nvim_get_keymap("n")`, so it is verified rather than copied from upstream docs.

### Files, search, buffers

| Key | Action |
| --- | --- |
| `<C-p>` | Find files (Telescope) |
| `<leader>ff` | Find files in project root |
| `<leader>fF` | Find files in current directory |
| `<leader>fe` / `<leader>fE` | File explorer, root / cwd |
| `<leader>fg` / `<leader>sg` | Grep in project (Telescope / snacks) |
| `<leader>sG` | Grep in current directory |
| `<leader>sW` | Search visual selection or word |
| `<leader>sB` | Grep only open buffers |
| `<leader>fr` / `<leader>fR` | Recent files, root / cwd |
| `<leader>fc` | Find config file |
| `<leader>fp` | Projects |
| `<leader>fb` / `<leader>sb` | Buffers (Telescope / snacks) |
| `<leader>fB` | All buffers |
| `<leader>sh` | Help pages |
| `<leader>sH` | Current file's highlights |
| `<leader>sm` | Marks |
| `<leader>sj` | Jumps |
| `<leader>s/` | Search history |
| `<leader>sc` | Command history |
| `<leader>s"` | Registers |

### Diagnostics, LSP, quickfix

| Key | Action |
| --- | --- |
| `<leader>sd` | Workspace diagnostics |
| `<leader>sD` | Diagnostics for this buffer |
| `<leader>sq` | Quickfix list |
| `<leader>sl` | Location list |
| `<leader>xx` | All diagnostics (Trouble) |
| `<leader>xQ` | Quickfix list (Trouble) |
| `<leader>xX` | This buffer's diagnostics (Trouble) |
| `<leader>xL` | Location list (Trouble) |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>cm` | Mason — install and manage language servers |

`gd` (go to definition), `gr` (rename) and friends are not global mappings. They are
registered by the language server into each buffer, so they only work in files where an
LSP has attached.

### Git

| Key | Action |
| --- | --- |
| `<leader>gs` | Git status |
| `<leader>gd` | Git diff, current hunk |
| `<leader>gD` | Git diff against `origin` |
| `<leader>gS` | Git stash |
| `<leader>gp` / `<leader>gP` | GitHub pull requests, open / all |
| `<leader>gi` / `<leader>gI` | GitHub issues, open / all |

### Other

| Key | Action |
| --- | --- |
| `<leader>sk` | Search keymaps |
| `<leader>sa` | Autocmds |
| `<leader>st` / `<leader>sT` | TODO / Fixme comments |
| `<leader>si` | Icon picker |
| `<leader>sn` | Noice messages |
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>qS` | Pick a session to restore |
| `<leader>qd` | Do not save the current session |
| `<leader>w` | Write file |
| `<leader>wq` | Write and quit |
| `<leader>q` | Quit |
| `<leader>a` | Quit all |
| `<leader>tv` | Vertical terminal (`$SHELL`, current directory) |
| `<leader>ta` | Vertical terminal running `claude` (project root) |
| `<leader>tc` | Vertical terminal running `codex` (project root) — needs `codex` installed |
| `jk` (insert) | Exit insert mode |
| `<leader><leader>` | Find files (root dir) — LazyVim maps double-tap leader here, not to which-key |

Two things that are *not* mapped, despite being common in other setups:

- **`l` / `<leader>l` for the plugin manager.** LazyVim does not bind it. Run `:Lazy`
  directly, or press `l` on the dashboard.
- **`<leader>L` to toggle lualine.** Needs `nvim-lualine/lualine-ls`, which is not
  installed. `:LualineToggle` is unavailable for the same reason.

### Lazygit is not wired up

`lazygit` is in LazyVim's core, but only as an `optional` spec: the plugin is skipped
entirely because the `lazygit.nvim` entry point is not in `lazy-lock.json`. Installing
the binary alone does nothing. To get `<leader>gg`, add this to any file in
`lua/plugins/`:

```lua
{ "folke/lazygit.nvim", optional = true, version = false, cmd = "lazygit" },
```

then run `:Lazy sync`. Git status and diffs already work without it, via `<leader>gs`
and `<leader>gd`.

`<leader>` is the space bar.

---

## Upgrading plugins

```sh
cd ~/.config/nvim
git pull
```

`lazy-lock.json` pins every plugin to a tested commit, so a pull is reproducible
rather than a surprise. To update plugins on purpose, use `:Lazy update` inside
Neovim, then commit the changed lockfile back to this repo.

Since `~/.config/nvim` is a clone of this repo, a `git pull` also picks up changes to
the config itself. Commit your edits from inside `~/.config/nvim`, never from a parent
dotfiles repo that tracks it as a submodule.

## Troubleshooting

**`rg` or `fd` reported as "not installed" by `:checkhealth lazyvim`.**
Apps launched from Finder or a dock icon don't inherit your shell `PATH`, so binaries
in `/opt/homebrew/bin` or `/usr/local/bin` can be invisible. Confirm with
`:echo $PATH` inside Neovim. The fix is to launch from a terminal, or export `PATH`
in a login shell (`~/.zprofile` on macOS) so GUI apps pick it up. There is no lazy.nvim
setting for this — `performance.rtp` only supports `disabled_plugins` and `paths`, not
a whitelist.

**Plugins didn't install.** Run `:Lazy sync` and read the output. Then
`:checkhealth lazyvim` for the environment, `:checkhealth lazy` for the manager.

**A plugin broke after an update.** Roll just the lockfile back to a known-good
commit — this does not touch your config files:

```sh
cd ~/.config/nvim
git log --oneline -- lazy-lock.json   # find a good commit
git checkout <sha> -- lazy-lock.json
```

Then run `:Lazy sync` inside Neovim. `:Lazy restore` also rolls back to the lockfile.

**Starting over.**

```sh
rm ~/.config/nvim                 # if it is a symlink, this only removes the link
rm -rf ~/.local/share/nvim        # plugins, lockfile, Mason binaries
```

---

## Uninstall

```sh
rm ~/.config/nvim
```

To remove the plugins too, delete `~/.local/share/nvim`. Nothing outside those two
locations is touched.

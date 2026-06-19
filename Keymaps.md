# Neovim Keymaps Reference Guide

This guide documents all custom keyboard shortcuts configured in your Neovim setup. Each entry shows the key combination, what it does, and a practical example.

---

## Table of Contents
1. [Essential Mappings](#essential-mappings)
2. [Better Defaults](#better-defaults)
3. [Clipboard & Registers](#clipboard--registers)
4. [Navigation](#navigation)
5. [Splits](#splits)
6. [Search & Replace](#search--replace)
7. [Text Manipulation](#text-manipulation)
8. [Advanced Editing](#advanced-editing)
9. [Case Manipulation](#case-manipulation)
10. [Quick Fixes & Diagnostics](#quick-fixes--diagnostics)
11. [LSP](#lsp)
12. [Word Movement](#word-movement)
13. [Terminal](#terminal)
14. [Utility](#utility)

---

## Essential Mappings

| Keys | Action | Example |
|------|--------|---------|
| `jk` | Exit insert mode | Press in insert mode to go back to normal mode |
| `<leader>w` | Save file | Save current file without typing `:w` |
| `<leader>q` | Quit window | Close current window |
| `<leader>x` | Save and quit | Save current file and close window |

---

## Better Defaults

| Keys | Action | Example |
|------|--------|---------|
| `<C-d>` | Page down (centered) | Press to scroll down, keeping cursor centered |
| `<C-u>` | Page up (centered) | Press to scroll up, keeping cursor centered |
| `n` | Next search result (centered) | After searching with `/`, press `n` to go to next match |
| `N` | Previous search result (centered) | Press to go to previous search match |
| `<` (visual) | Indent left, keep selection | Select text, press `<` to unindent, stays selected |
| `>` (visual) | Indent right, keep selection | Select text, press `>` to indent, stays selected |
| `<A-j>` | Move line down | Move current line one line down |
| `<A-k>` | Move line up | Move current line one line up |
| `<A-j>` (visual) | Move selection down | Select multiple lines, move them down |
| `<A-k>` (visual) | Move selection up | Select multiple lines, move them up |
| `J` (visual) | Expand selection down | In visual mode, extend selection downward |
| `K` (visual) | Expand selection up | In visual mode, extend selection upward |
| `v` | Start visual selection | Enter character-wise visual mode |
| `V` | Start line selection | Enter line-wise visual mode |
| `<C-v>` | Start block selection | Enter block visual mode |

---

## Clipboard & Registers

| Keys | Action | Example |
|------|--------|---------|
| `x` | Delete char without yanking | Delete a character without copying to clipboard |
| `<leader>d` | Delete without yanking | Delete a word/line without copying |
| `<leader>d` (visual) | Delete selection without yanking | Delete selected text without copying |
| `p` (visual) | Paste without yanking | Replace selection and keep original in clipboard |
| `<leader>p` | Paste from system clipboard | Paste text from macOS clipboard |
| `<leader>p` (visual) | Paste from system clipboard | Replace selection with clipboard content |
| `<leader>y` | Yank to system clipboard | Copy to macOS clipboard |
| `<leader>y` (visual) | Yank selection to clipboard | Copy selected text to macOS clipboard |
| `<leader>gp` | Select pasted text | Paste and immediately select what was pasted |
| `<leader>"` | Show registers | View all your copy/paste registers |

---

## Navigation

| Keys | Action | Example |
|------|--------|---------|
| `<C-h>` | Focus left window | Jump to split pane on the left |
| `<C-j>` | Focus lower window | Jump to split pane below |
| `<C-k>` | Focus upper window | Jump to split pane above |
| `<C-l>` | Focus right window | Jump to split pane on the right |
| `%` | Jump to matching bracket | On `{`, jump to closing `}` |
| `gg` | Go to beginning of file | Jump to top of document |
| `G` | Go to end of file | Jump to bottom of document |
| `{` | Jump to previous paragraph | Go to previous blank line |
| `}` | Jump to next paragraph | Go to next blank line |
| `<leader>.` | Widen window | Make split pane wider (3 cols) |
| `<leader>,` | Narrow window | Make split pane narrower (3 cols) |
| `<leader>]` | Taller window | Make split pane taller (3 rows) |
| `<leader>[` | Shorter window | Make split pane shorter (3 rows) |
| `<leader>=` | Equalize windows | Make all split panes equal size |
| `<leader>tn` | New tab | Create a new tab |
| `<leader>tc` | Close tab | Close current tab |
| `<leader>to` | Close other tabs | Close all tabs except current |
| `gt` | Next tab | Move to next tab |
| `gT` | Previous tab | Move to previous tab |

---

## Splits

| Keys | Action | Example |
|------|--------|---------|
| `<leader>sv` | Vertical split | Split window vertically |
| `<leader>sh` | Horizontal split | Split window horizontally |

**Example workflow:**
```
<leader>sv    → Create vertical split
<C-l>         → Move to right pane
<leader>sh    → Create horizontal split
```

---

## Search & Replace

| Keys | Action | Example |
|------|--------|---------|
| `<Esc>` | Clear search highlight | After searching, remove highlights |
| `<leader>rw` | Replace word under cursor | Replace all instances of current word |
| `<leader>/` | Toggle search highlight | Turn search highlighting on/off |
| `//` (visual) | Search selection | Select text, press `//` to search for it |

**Example:**
```
Position cursor on "foo"
<leader>rw    → Opens replace dialog for all "foo"
Type "bar"
Press Enter   → Replaces all instances
```

---

## Text Manipulation

| Keys | Action | Example |
|------|--------|---------|
| `J` | Join lines (cursor centered) | Merge current line with next line |
| `<leader>aa` | Select all | Select entire file |
| `<leader>ld` | Duplicate line | Copy current line below it |
| `<leader>ld` (visual) | Duplicate selection | Copy selected lines below |
| `<leader>ck` | Delete line | Remove entire line |
| `<leader>cc` | Copy line | Copy entire line to clipboard |
| `<leader>cl` | Clear line | Delete content, keep empty line |
| `H` | Go to start of line | Jump to beginning of line |
| `L` | Go to end of line | Jump to end of line |
| `<leader>no` | Add line above | Insert blank line above cursor |
| `<leader>ni` | Add line below | Insert blank line below cursor |
| `+` | Increment number | Increase number under cursor by 1 |
| `-` | Decrement number | Decrease number under cursor by 1 |
| `gw` | Swap word with next | Exchange current word with next word |

**Example:**
```
Line: hello world
Position on "hello"
gw            → Becomes: world hello
```

---

## Advanced Editing

| Keys | Action | Example |
|------|--------|---------|
| `<leader>vw` | Select word | Select word under cursor |
| `cw` | Change word | Delete word and enter insert mode |
| `dw` | Delete word | Remove word under cursor |
| `vl` | Select to end of line | Select from cursor to line end |
| `yl` | Copy to end of line | Copy from cursor to line end |
| `dl` | Delete to end of line | Remove from cursor to line end |
| `vh` | Select to start of line | Select from cursor to line start |
| `yh` | Copy to start of line | Copy from cursor to line start |
| `dh` | Delete to start of line | Remove from cursor to line start |
| `<leader><CR>` | Insert line below | Add new line and stay in normal mode |
| `<C-r>` | Redo | Redo last undone action |
| `.` | Repeat last command | Repeat the last action |

**Example:**
```
Line: "The quick brown fox"
Position at 'q', press: cw    → Deletes "quick", enters insert mode
Type: "slow"                  → Line becomes: "The slow brown fox"
```

---

## Case Manipulation

| Keys | Action | Example |
|------|--------|---------|
| `<leader>u` | Lowercase word | Convert word under cursor to lowercase |
| `<leader>U` | Uppercase word | Convert word under cursor to UPPERCASE |
| `g~` | Toggle case | Swap case of character under cursor |
| `<leader>u` (visual) | Lowercase selection | Convert selected text to lowercase |
| `<leader>U` (visual) | Uppercase selection | Convert selected text to UPPERCASE |

**Example:**
```
Word: "Hello"
<leader>u     → Becomes: "hello"
<leader>U     → Becomes: "HELLO"
```

---

## Quick Fixes & Diagnostics

| Keys | Action | Example |
|------|--------|---------|
| `[d` | Previous diagnostic | Jump to previous error/warning |
| `]d` | Next diagnostic | Jump to next error/warning |
| `<leader>de` | Show line diagnostics | Display errors/warnings for current line |
| `[q` | Previous quickfix | Go to previous item in quickfix list |
| `]q` | Next quickfix | Go to next item in quickfix list |
| `<leader>qo` | Open quickfix | Show quickfix window |
| `<leader>qc` | Close quickfix | Hide quickfix window |

---

## LSP

| Keys | Action | Example |
|------|--------|---------|
| `gd` | Go to definition | Jump to where symbol is defined |
| `gD` | Go to declaration | Jump to declaration of symbol |
| `gi` | Go to implementation | Jump to implementation |
| `gr` | List references | Show all places symbol is used |
| `K` | Hover documentation | Show docs/type info for symbol |
| `<leader>rn` | Rename symbol | Rename all instances of symbol |
| `<leader>ca` | Code action | Show available fixes/actions |
| `<leader>lf` | Format file | Auto-format entire file |
| `<leader>ls` | Signature help | Show function signature info |

**Example workflow:**
```
Position on function name
K               → Shows function documentation
gd              → Jump to function definition
<leader>rn      → Rename all uses of function
<leader>ca      → Show code fixes
```

---

## Buffers

| Keys | Action | Example |
|------|--------|---------|
| `<leader>bn` | Next buffer | Switch to next open file |
| `<leader>bp` | Previous buffer | Switch to previous open file |
| `<leader>bd` | Delete buffer | Close current file |
| `<leader>bl` | New buffer | Create new empty buffer |
| `<leader>bh` | Close hidden buffers | Close buffers not shown in a window |
| `<leader>bu` | Close nameless buffers | Close buffers without a file name |

---

## Word Movement

| Keys | Action | Example |
|------|--------|---------|
| `w` | Word forward | Move cursor to start of next word |
| `b` | Word backward | Move cursor to start of previous word |
| `e` | End of word | Move cursor to end of current word |
| `W` | WORD forward | Move to next WORD (separated by spaces) |
| `B` | WORD backward | Move to previous WORD |

**Example:**
```
Line: "hello-world test"
On "h":
w     → Moves to "w" in world
W     → Moves to "t" in test
b     → Moves back to "h"
e     → Moves to "o" at end of hello
```

---

## Terminal

| Keys | Action | Example |
|------|--------|---------|
| `<C-t>` | Toggle floating terminal | Open/close floating terminal window |
| `<leader>tv` | Toggle vertical terminal | Open/close terminal on right side |
| `<leader>th` | Toggle horizontal terminal | Open/close terminal on bottom |
| `jk` (in terminal) | Exit terminal | Return to normal mode in terminal |

**Example workflow:**
```
<C-t>         → Open floating terminal
Type command  → Run any shell command
jk            → Exit terminal mode
<C-t>         → Close terminal
```

---

## Utility

| Keys | Action | Example |
|------|--------|---------|
| `<leader><leader>` | Source current file | Reload Lua config file |
| `<leader>X` | Make file executable | Add execute permission (chmod +x) |
| `<leader>sp` | Toggle spell check | Turn spell checking on/off |
| `<leader>st` | Show char count | Display number of characters in file |
| `zf` | Create fold | Collapse selected lines |
| `za` | Toggle fold | Open/close a fold |
| `zo` | Open fold | Expand collapsed lines |
| `zc` | Close fold | Collapse lines |
| `zR` | Open all folds | Expand all folds in file |
| `zM` | Close all folds | Collapse all folds in file |
| `<leader>m` | Set mark | Mark current position with letter |
| `<leader>'` | Go to mark | Jump to a marked position |
| `<leader>cd` | Change dir to file | Set working directory to current file location |
| `<leader>ee` | Open in Finder | Open current directory in macOS Finder |

**Example workflow:**
```
Code to fold:
Select lines
zf            → Create fold
zo            → Open fold
zc            → Close fold
zM            → Close all folds
zR            → Open all folds
```

---

## Quick Reference Cheatsheet

### Most Used
| Keys | Action |
|------|--------|
| `jk` | Exit insert mode |
| `<leader>w` | Save |
| `<leader>d` | Delete without copy |
| `<leader>y` | Copy to clipboard |
| `<leader>p` | Paste from clipboard |
| `<C-h/j/k/l>` | Move between splits |
| `<leader>rn` | Rename symbol |
| `gd` | Go to definition |
| `<C-t>` | Toggle terminal |

### Navigation Combos
| Keys | Action |
|------|--------|
| `gg` | Go to top |
| `G` | Go to bottom |
| `gt` | Next tab |
| `gT` | Previous tab |
| `%` | Jump to matching bracket |

### Text Editing
| Keys | Action |
|------|--------|
| `<leader>ld` | Duplicate line |
| `<leader>ck` | Delete line |
| `<leader>no` | New line above |
| `<leader>ni` | New line below |
| `H` / `L` | Start / End of line |

---

## Tips & Tricks

1. **Combine motions with operators:**
   - `d` (delete) + `w` (word) = `dw` (delete word)
   - `y` (yank) + `l` (end of line) = `yl` (copy to end of line)
   - `c` (change) + `i` (inner) `w` (word) = `ciw` (change word)

2. **Use `.` to repeat:**
   - Make an edit: `<leader>ld` (duplicate line)
   - Repeat it: `.` (duplicate again)

3. **Combine visual mode with operations:**
   - Select text: `v` or `V` or `<C-v>`
   - Apply operation: `<leader>U` (uppercase), `<leader>y` (copy), etc.

4. **Mark positions for quick navigation:**
   - Set mark: `<leader>m` + letter (e.g., `ma`)
   - Jump to mark: `<leader>'` + letter (e.g., `'a`)

5. **Terminal for quick commands:**
   - `<C-t>` to open floating terminal
   - Run shell commands without leaving editor
   - `jk` to exit and return to editing

---

## Legend

- `<leader>` = Your leader key (usually configured as space)
- `<C-x>` = Press Ctrl + x
- `<A-x>` = Press Alt + x
- `<leader>x` = Press leader key, then x
- `jk` = Press j then k in sequence

---

**Last Updated:** February 25, 2026

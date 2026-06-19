local keymap = vim.keymap

local function map(mode, lhs, rhs, desc, extra)
	local opts = vim.tbl_extend("force", { noremap = true, silent = true, desc = desc }, extra or {})
	keymap.set(mode, lhs, rhs, opts)
end

-- ============================================================================
-- ESSENTIAL MAPPINGS
-- ============================================================================

-- Quick escape from insert mode
map("i", "hh", "<Esc>", "Exit insert mode")

-- Save file quickly
map("n", "<leader>w", "<cmd>w<cr>", "Save file")
map("n", "<leader>q", "<cmd>q<cr>", "Quit window")
map("n", "<leader>x", "<cmd>x<cr>", "Save and quit")

-- ============================================================================
-- BETTER DEFAULTS
-- ============================================================================

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", "Page down centered")
map("n", "<C-u>", "<C-u>zz", "Page up centered")
map("n", "n", "nzzzv", "Next search result centered")
map("n", "N", "Nzzzv", "Prev search result centered")

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", "Indent left and keep selection")
map("v", ">", ">gv", "Indent right and keep selection")

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- Expand selection
map("v", "J", ":m '>+1<CR>gv", "Expand selection down")
map("v", "K", ":m '<-2<CR>gv", "Expand selection up")

-- Smart selection expand/shrink
map("n", "v", "v", "Start visual selection")
map("n", "V", "V", "Start line selection")
map("n", "<C-v>", "<C-v>", "Start block selection")

-- ============================================================================
-- CLIPBOARD & REGISTERS
-- ============================================================================

-- Delete without yanking
map("n", "x", '"_x', "Delete char without yanking")
map("n", "<leader>d", '"_d', "Delete without yanking")
map("v", "<leader>d", '"_d', "Delete selection without yanking")

-- Paste without losing clipboard
map("v", "p", '"_dP', "Paste without yanking")

-- Paste from system clipboard
map("n", "<leader>p", '"+p', "Paste from system clipboard")
map("v", "<leader>p", '"+p', "Paste from system clipboard")

-- Yank to system clipboard
map("n", "<leader>y", '"+y', "Yank to system clipboard")
map("v", "<leader>y", '"+y', "Yank to system clipboard")

-- Paste and select pasted text
map("n", "<leader>gp", "`[v`]", "Select pasted text")

-- Cycle through registers
map("n", '<leader>"', '"', "Show registers")

-- ============================================================================
-- NAVIGATION
-- ============================================================================

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "Focus left window")
map("n", "<C-j>", "<C-w>j", "Focus lower window")
map("n", "<C-k>", "<C-w>k", "Focus upper window")
map("n", "<C-l>", "<C-w>l", "Focus right window")

-- Jump to matching bracket
map("n", "%", "%", "Jump to matching bracket")

-- Go to beginning/end of file
map("n", "gg", "gg", "Go to beginning")
map("n", "G", "G", "Go to end")

-- Navigate previous/next paragraph
map("n", "{", "{", "Previous paragraph")
map("n", "}", "}", "Next paragraph")

-- Resize windows (simple and works)
map("n", "<leader>.", ":vertical resize +3<CR>", "Widen window")
map("n", "<leader>,", ":vertical resize -3<CR>", "Narrow window")
map("n", "<leader>]", ":resize +3<CR>", "Taller window")
map("n", "<leader>[", ":resize -3<CR>", "Shorter window")
map("n", "<leader>=", "<C-w>=", "Equalize windows")

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", "New tab")
map("n", "<leader>tc", "<cmd>tabclose<cr>", "Close tab")
map("n", "<leader>to", "<cmd>tabonly<cr>", "Close other tabs")
map("n", "gt", "<cmd>tabnext<cr>", "Next tab")
map("n", "gT", "<cmd>tabprevious<cr>", "Previous tab")

-- ============================================================================
-- SPLITS
-- ============================================================================

map("n", "<leader>sv", "<cmd>vsplit<cr>", "Vertical split")
map("n", "<leader>sh", "<cmd>split<cr>", "Horizontal split")

-- ============================================================================
-- SEARCH & REPLACE
-- ============================================================================

-- Clear search highlight
map("n", "<Esc>", "<cmd>noh<cr>", "Clear search highlight")

-- Search and replace word under cursor
map("n", "<leader>rw", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word under cursor")

-- Toggle search highlight
map("n", "<leader>/", "<cmd>set hlsearch!<cr>", "Toggle search highlight")

-- Search selection
map("v", "//", "y/\\V<C-R>=escape(@\",'/\\\\')<CR><CR>", "Search selection")

-- ============================================================================
-- TEXT MANIPULATION
-- ============================================================================

-- Join lines without moving cursor
map("n", "J", "mzJ`z", "Join lines without moving cursor")

-- Select all
map("n", "<leader>aa", "gg<S-v>G", "Select all")

-- Duplicate line
map("n", "<leader>ld", ":copy.<CR>", "Duplicate line")
map("v", "<leader>ld", ":copy '<-1<CR>", "Duplicate selection")

-- Delete entire line
map("n", "<leader>ck", ":normal dd<CR>", "Delete line")

-- Copy entire line
map("n", "<leader>cc", ":normal yy<CR>", "Copy line")

-- Clear line (delete content but keep line)
map("n", "<leader>cl", ":normal ddO<Esc>", "Clear line")

-- Move to beginning/end of line
map("n", "H", "^", "Go to start of line")
map("n", "L", "$", "Go to end of line")
map("v", "H", "^", "Go to start of line")
map("v", "L", "$", "Go to end of line")

-- Insert blank line above/below
map("n", "<leader>no", "O<Esc>", "Add line above")
map("n", "<leader>ni", "o<Esc>", "Add line below")

-- Increment/decrement
map("n", "+", "<C-a>", "Increment")
map("n", "-", "<C-x>", "Decrement")

-- Swap words/lines
map("n", "gw", "dawP", "Swap word with next")

-- ============================================================================
-- ADVANCED EDITING
-- ============================================================================

-- Quick word selection/deletion
map("n", "<leader>vw", "viw", "Select word")
map("n", "cw", "ciw", "Change word")
map("n", "dw", "diw", "Delete word")

-- Select to end of line
map("n", "vl", "v$", "Select to end of line")
map("n", "yl", "y$", "Copy to end of line")
map("n", "dl", "d$", "Delete to end of line")

-- Select from beginning of line
map("n", "vh", "v^", "Select to start of line")
map("n", "yh", "y^", "Copy to start of line")
map("n", "dh", "d^", "Delete to start of line")

-- Quick insert empty line with proper indentation
map("n", "<leader><CR>", ":normal o<CR>", "Insert line below")

-- Redo (complement undo)
map("n", "<C-r>", "<cmd>redo<cr>", "Redo")

-- Repeat last command
map("n", ".", ".", "Repeat last command")

-- ============================================================================
-- CASE MANIPULATION
-- ============================================================================

-- Cycle case of word under cursor
map("n", "<leader>u", "guiw", "Lowercase word")
map("n", "<leader>U", "gUiw", "Uppercase word")
map("n", "g~", "g~", "Toggle case")

-- Visual case change
map("v", "<leader>u", "gu", "Lowercase selection")
map("v", "<leader>U", "gU", "Uppercase selection")

-- ============================================================================
-- QUICK FIXES & DIAGNOSTICS
-- ============================================================================

-- Navigate diagnostics
map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "<leader>de", vim.diagnostic.open_float, "Line diagnostics")

-- QuickFix navigation
map("n", "[q", "<cmd>cprev<cr>", "Prev quickfix")
map("n", "]q", "<cmd>cnext<cr>", "Next quickfix")
map("n", "<leader>qo", "<cmd>copen<cr>", "Open quickfix")
map("n", "<leader>qc", "<cmd>cclose<cr>", "Close quickfix")

-- ============================================================================
-- LSP
-- ============================================================================

map("n", "gd", vim.lsp.buf.definition, "Go to definition")
map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
map("n", "gr", vim.lsp.buf.references, "List references")
map("n", "K", vim.lsp.buf.hover, "Hover documentation")
map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
map("n", "<leader>lf", function()
	vim.lsp.buf.format({ async = true })
end, "Format file")

-- Quick signature help
map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", "Next buffer")
map("n", "<leader>bp", "<cmd>bprev<cr>", "Prev buffer")
map("n", "<leader>bd", "<cmd>bdelete<cr>", "Delete buffer")
map("n", "<leader>bl", "<cmd>enew<cr>", "New buffer")

-- ============================================================================
-- WORD MOVEMENT
-- ============================================================================

-- Jump words
map("n", "w", "w", "Word forward")
map("n", "b", "b", "Word backward")
map("n", "e", "e", "End of word")

-- Jump to next/prev word boundary
map("n", "W", "W", "WORD forward")
map("n", "B", "B", "WORD backward")

-- ============================================================================
-- TERMINAL
-- ============================================================================

local M = {}

M.terminals = {
	floating = { buf = nil, win = nil },
	vertical = { buf = nil, win = nil },
	horizontal = { buf = nil, win = nil },
}

local function close_terminal(term)
	if term.win and vim.api.nvim_win_is_valid(term.win) then
		vim.api.nvim_win_close(term.win, true)
		term.buf = nil
		term.win = nil
	end
end

local function open_terminal(term, kind)
	local buf = vim.api.nvim_create_buf(false, true)
	local win

	if kind == "floating" then
		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.8)
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)
		win = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		})
	elseif kind == "vertical" then
		vim.cmd("vsplit")
		win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_buf(win, buf)
		vim.api.nvim_win_set_width(win, math.floor(vim.o.columns * 0.4))
	elseif kind == "horizontal" then
		vim.cmd("split")
		win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_buf(win, buf)
		vim.api.nvim_win_set_height(win, math.floor(vim.o.lines * 0.3))
	end

	vim.fn.termopen(vim.o.shell, { cwd = vim.fn.getcwd() })
	vim.cmd("startinsert")

	keymap.set("t", "jk", function()
		close_terminal(M.terminals[kind])
	end, { buffer = buf, silent = true })

	term.buf = buf
	term.win = win
end

local function toggle(kind)
	local term = M.terminals[kind]
	if term.win and vim.api.nvim_win_is_valid(term.win) then
		close_terminal(term)
	else
		open_terminal(term, kind)
	end
end

-- Terminal toggles
map("n", "<C-t>", function()
	toggle("floating")
end, "Toggle floating terminal")
map("n", "<leader>tv", function()
	toggle("vertical")
end, "Toggle vertical terminal")
map("n", "<leader>th", function()
	toggle("horizontal")
end, "Toggle horizontal terminal")

-- ============================================================================
-- UTILITY
-- ============================================================================

-- Source current file
map("n", "<leader><leader>", "<cmd>so %<cr>", "Source current file")

-- Make current file executable
map("n", "<leader>X", "<cmd>!chmod +x %<cr>", "Make file executable", { silent = true })

-- Toggle spell check
map("n", "<leader>sp", "<cmd>set spell!<cr>", "Toggle spell check")

-- Show file stats
map("n", "<leader>st", "<cmd>%s/./&/gn<cr>", "Show char count")

-- Fold shortcuts
map("n", "zf", "zf", "Create fold")
map("n", "za", "za", "Toggle fold")
map("n", "zo", "zo", "Open fold")
map("n", "zc", "zc", "Close fold")
map("n", "zR", "zR", "Open all folds")
map("n", "zM", "zM", "Close all folds")

-- Mark navigation
map("n", "<leader>m", "m", "Set mark")
map("n", "<leader>'", "'", "Go to mark")

-- Change directory to current file
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", "Change dir to file")

-- Open file explorer at current directory
map("n", "<leader>ee", "<cmd>!open .<cr>", "Open in Finder")

return M

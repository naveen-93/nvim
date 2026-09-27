-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- <leader>q / <leader>w are LazyVim which-key groups. These mappings sit on top
-- of the group keys, so the group's children (<leader>qs, <leader>ww, ...) keep
-- working; only the bare prefix is taken over.
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and Quit" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>a", "<cmd>quitall<cr>", { desc = "Quit All" })

-- Opens a terminal in a 45% wide vertical split running `command`, with cwd as
-- the working directory. Handles the executable being missing, and wires up
-- <C-q> plus a TermClose autocmd so the window never lingers.
local function open_vertical_terminal(command, cwd)
  if vim.fn.executable(command) ~= 1 then
    vim.notify(command .. " is not installed or not available in PATH", vim.log.levels.ERROR)
    return
  end

  vim.cmd("vsplit")
  vim.cmd("enew")
  vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.45))

  local buffer = vim.api.nvim_get_current_buf()
  local window = vim.api.nvim_get_current_win()
  local job = vim.fn.jobstart({ command }, {
    cwd = cwd,
    term = true,
  })

  if job <= 0 then
    if vim.api.nvim_win_is_valid(window) then
      vim.api.nvim_win_close(window, true)
    end
    vim.api.nvim_buf_delete(buffer, { force = true })
    vim.notify("Failed to start " .. command, vim.log.levels.ERROR)
    return
  end

  local closing = false
  local function close_terminal()
    if closing then
      return
    end
    closing = true

    if vim.api.nvim_win_is_valid(window) then
      pcall(vim.api.nvim_win_close, window, true)
    end
    if vim.api.nvim_buf_is_valid(buffer) then
      pcall(vim.api.nvim_buf_delete, buffer, { force = true })
    end
  end

  vim.keymap.set({ "n", "t" }, "<C-q>", close_terminal, {
    buffer = buffer,
    desc = "Close Terminal",
  })

  vim.api.nvim_create_autocmd("TermClose", {
    buffer = buffer,
    once = true,
    callback = function()
      vim.schedule(close_terminal)
    end,
  })

  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>tv", function()
  open_vertical_terminal(vim.o.shell, vim.fn.getcwd())
end, { desc = "Vertical Terminal" })

vim.keymap.set("n", "<leader>tc", function()
  open_vertical_terminal("codex", LazyVim.root())
end, { desc = "Codex (Project Root)" })

vim.keymap.set("n", "<leader>ta", function()
  open_vertical_terminal("claude", LazyVim.root())
end, { desc = "Claude Code (Project Root)" })

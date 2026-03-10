-- This module is not currently used in the configuration.
-- LSP utility functions for toggling inlay hints and autoformat.
-- To use these keymaps, add them to keymaps.lua:
--   map("n", "<leader>li", require("craftzdog.lsp").toggleInlayHints, "Toggle inlay hints")
--   map("n", "<leader>la", require("craftzdog.lsp").toggleAutoformat, "Toggle autoformat")

local M = {}
local LazyvimUtil = require("lazyvim.util")

function M.toggleInlayHints()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.toggleAutoformat()
	LazyvimUtil.format.toggle()
end

return M

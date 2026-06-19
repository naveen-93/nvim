if vim.loader then
	vim.loader.enable()
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "blink.cmp"

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
require("config.options")
require("config.autocmds")
require("config.keymaps")

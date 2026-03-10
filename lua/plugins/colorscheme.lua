return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					functions = { bold = true },
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
				sidebars = { "qf", "terminal", "help", "neo-tree" },
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
			}
		end,
	},
}
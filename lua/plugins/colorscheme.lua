-- Colorscheme
-- Docs: https://github.com/craftzdog/solarized-osaka.nvim
return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = {},
  },

  -- load the colorscheme
  { "LazyVim/LazyVim", opts = { colorscheme = "solarized-osaka" } },
}

return {

  { "sainnhe/everforest" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim" },
  { "folke/tokyonight.nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    opts = {
      borderless_telescope = false,
    },
  },
  { "eldritch-theme/eldritch.nvim" },
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}

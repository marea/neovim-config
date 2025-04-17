return {
  { "xiyaowong/transparent.nvim", enabled = false },
  {
    "martineausimon/nvim-xresources",
    config = function()
      require("nvim-xresources").setup({})
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "xresources",
    },
  },
}

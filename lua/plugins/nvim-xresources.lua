return {
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

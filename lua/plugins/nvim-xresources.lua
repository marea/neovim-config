return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
        },
      })
    end,
  },
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

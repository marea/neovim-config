return {
  { "daedlock/matugen.nvim" },
  {
    "RRethy/base16-nvim",
    config = function()
      require("matugen").setup()
    end,
  },
}

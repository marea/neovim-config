return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup { disable_when_zoomed = true }
    end,
    lazy = false,
  },
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    init = function()
      require "configs.mason-lspconfig"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = require("configs.servers").treesitter },
  },
  {
    "habamax/vim-godot",
    ft = "gdscript",
    config = function()
      require "configs.vim-godot"
    end,
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require "configs.flutter-tools"
    end,
  },
}

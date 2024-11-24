---@diagnostic disable:undefined-global
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit Insert mode" })
map("i", "kj", "<ESC>", { desc = "Exit Insert mode" })

map(
  "n",
  "<C-h>",
  require("nvim-tmux-navigation").NvimTmuxNavigateLeft,
  { desc = "Switch window left" }
)
map(
  "n",
  "<C-j>",
  require("nvim-tmux-navigation").NvimTmuxNavigateDown,
  { desc = "Switch window down" }
)
map(
  "n",
  "<C-k>",
  require("nvim-tmux-navigation").NvimTmuxNavigateUp,
  { desc = "Switch window up" }
)
map(
  "n",
  "<C-l>",
  require("nvim-tmux-navigation").NvimTmuxNavigateRight,
  { desc = "Switch window right" }
)

map(
  "n",
  "<leader>lf",
  vim.diagnostic.open_float,
  { desc = "Open floating diagnostics" }
)

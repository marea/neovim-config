return {
  "alexghergh/nvim-tmux-navigation",
  opts = {
    disable_when_zoomed = true,
  },
  keys = {
    { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Switch window left" },
    { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Switch window down" },
    { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Switch window up" },
    { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Switch window right" },
  },
}

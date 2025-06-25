return {
  "allaman/emoji.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function(_, opts)
    require("emoji").setup(opts)
    local ts = require("telescope").load_extension("emoji")
    vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji" })
  end,
}

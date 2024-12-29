return {
  'xiyaowong/transparent.nvim',
  { -- Colorscheme
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000,
    init = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme 'oxocarbon'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  'tpope/vim-sleuth',
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup { disable_when_zoomed = true }
      vim.keymap.set('n', '<C-h>', require('nvim-tmux-navigation').NvimTmuxNavigateLeft, { desc = 'Switch window left' })
      vim.keymap.set('n', '<C-j>', require('nvim-tmux-navigation').NvimTmuxNavigateDown, { desc = 'Switch window down' })
      vim.keymap.set('n', '<C-k>', require('nvim-tmux-navigation').NvimTmuxNavigateUp, { desc = 'Switch window up' })
      vim.keymap.set('n', '<C-l>', require('nvim-tmux-navigation').NvimTmuxNavigateRight, { desc = 'Switch window right' })
    end,
    lazy = false,
  },
  { 'folke/lazydev.nvim', ft = 'lua', opts = {
    library = {
      { path = 'luvit-meta/library', words = { 'vim%.uv' } },
    },
  } },
  { 'Bilal2453/luvit-meta', lazy = true },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'nvim-treesitter/nvim-treesitter-context',
}

-- vim: ts=2 sts=2 sw=2 et

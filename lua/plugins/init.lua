return {
  'xiyaowong/transparent.nvim',
  { -- Colorscheme
    'martineausimon/nvim-xresources',
    lazy = false,
    priority = 1000,
    init = function()
      require('nvim-xresources').setup {
        --  Optional config:
        --  xresources_path = os.getenv("HOME") .. '/.Xresources',
        --  auto_light = {
        --    enable = true,
        --    value = 0.5,
        --    exclude = {},
        --  },
        --  contrast = 1,
        --  bold = true,
        --  palette_overrides = {},
        --  fallback_theme = "nord"
      }
      --local C = require('nvim-xresources.colors')
      --require('nvim-xresources').custom_highlight_groups({ })

      vim.cmd 'colorscheme xresources'
    end,
  },
  'tpope/vim-sleuth',
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup { disable_when_zoomed = true }
      vim.keymap.set(
        'n',
        '<C-h>',
        require('nvim-tmux-navigation').NvimTmuxNavigateLeft,
        { desc = 'Switch window left' }
      )
      vim.keymap.set(
        'n',
        '<C-j>',
        require('nvim-tmux-navigation').NvimTmuxNavigateDown,
        { desc = 'Switch window down' }
      )
      vim.keymap.set(
        'n',
        '<C-k>',
        require('nvim-tmux-navigation').NvimTmuxNavigateUp,
        { desc = 'Switch window up' }
      )
      vim.keymap.set(
        'n',
        '<C-l>',
        require('nvim-tmux-navigation').NvimTmuxNavigateRight,
        { desc = 'Switch window right' }
      )
    end,
    lazy = false,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  'nvim-treesitter/nvim-treesitter-context',
  {
    'ap/vim-buftabline',
    config = function()
      vim.keymap.set('n', '<Tab>', ':bnext<CR>')
      vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
      vim.keymap.set('n', '<leader>x', ':bd<CR>')
    end,
  },
  {
    'javiorfo/nvim-soil',
    lazy = true,
    ft = 'plantuml',
    opts = {
      actions = {
        redraw = true,
      },
      --puml_jar = "/path/to/plantuml.jar",
      image = {
        darkmode = false,
        format = 'png',
        execute_to_open = function(img)
          return 'nsxiv -b ' .. img
        end,
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et

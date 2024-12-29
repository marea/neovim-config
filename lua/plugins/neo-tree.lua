return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  config = function()
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { 'NeoTreeNormal' })
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { 'NeoTreeNormalNC' })
  end,
}

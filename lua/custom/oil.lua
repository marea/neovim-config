local gh = require('utils').gh

vim.pack.add { gh 'stevearc/oil.nvim' }

require('oil').setup {
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  watch_for_changes = false,
  keymaps = {
    ['g?'] = { 'actions.show_help', mode = 'n' },
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
    ['<C-t>'] = { 'actions.select', opts = { tab = true } },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = { 'actions.close', mode = 'n' },
    ['q'] = { 'actions.close', mode = 'n' },
    ['<C-l>'] = 'actions.refresh',
    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    ['`'] = { 'actions.cd', mode = 'n' },
    ['g~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gx'] = 'actions.open_external',
    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
    ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
  },
  float = {
    padding = 2,
    max_width = 0.8,
    max_height = 0.8,
    border = 'rounded',
    win_options = {
      winblend = 0,
    },
  },
  confirmation = {
    border = 'rounded',
  },
  progress = {
    border = 'rounded',
  },
  ssh = {
    border = 'rounded',
  },
  keymaps_help = {
    border = 'rounded',
  },
}

vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open file explorer' })

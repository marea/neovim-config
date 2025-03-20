vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Options ]]
vim.o.expandtab = true
vim.opt.shiftwidth = 2
vim.o.smartindent = true
vim.opt.tabstop = 2
vim.o.softtabstop = 2

vim.opt.shortmess:append 'sI'

vim.opt.colorcolumn = '80'
vim.opt.textwidth = 80

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- [[ Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Alternative exit to normal mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Alternative exit to normal mode' })

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ lazy.nvim bootstraping ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Plugins ]]
require('lazy').setup({
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has 'win32' ~= 0
local sep = is_windows and '\\' or '/'
local delim = is_windows and ';' or ':'
vim.env.PATH = table.concat({ vim.fn.stdpath 'data', 'mason', 'bin' }, sep)
  .. delim
  .. vim.env.PATH

-- vim: ts=2 sts=2 sw=2 et

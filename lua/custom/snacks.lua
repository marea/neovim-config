local gh = require('utils').gh

vim.pack.add { gh 'folke/snacks.nvim' }

require('snacks').setup {
  image = {
    enabled = true,
    doc = {
      max_height = 1,
    },
  },
  dashboard = {
    enabled = true,
    preset = {
      header = [[
▄  ▄▓▄ ▄▓▄    ▄▓▓▄ █▄  ▄ ▄▓▄    ▄▓▓▄    ▄▓▓▄ █▄
 ▓▒▀ ▓█▀ ▓█  ░▒▀  ▀▒░   ░▒  ▀  ░▒  ▒█  ░▒▀  ▀▒░
 ▀░  ▀▀  ▀▀  ▄▄    ▄▀   ▀▄     ▄▄ ▀▀   ▄▄    ▄▀
 ▒▄  ▒▓  ▒▓  ▀░▒▄ ▄░▒   ▒░▄    ▀░▒▄ ▄  ▀░▒▄ ▄░▒
▀ ▀  ▀▀  ▀▀    ▀▀▀  ▀  ▀▀  ▀     ▀▀▀     ▀▀▀  ▀
      ]],
    },
    sections = {
      {
        section = 'header',
      },
      {
        pane = 2,
        section = 'terminal',
        cmd = 'chafa ~/.images/nvim-dash.jpg --format symbols --symbols all --size 60x60 --stretch; sleep .1',
        width = 60,
        height = 60,
        padding = 0,
      },
      { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
      { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
      { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
    },
  },
  terminal = {
    enabled = true,
  },
}

vim.keymap.set({ 'n', 't' }, '<C-/>', Snacks.terminal.toggle)

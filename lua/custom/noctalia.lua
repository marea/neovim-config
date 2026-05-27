local gh = require('utils').gh

vim.pack.add { gh 'keremimo/noctalia.nvim' }
require('noctalia').setup {
  auto_reload = true,
  transparent = true,
  terminal_colors = true,
}

vim.cmd.colorscheme 'noctalia'

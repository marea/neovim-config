local gh = require('utils').gh

if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.pack.add { gh 'windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}

vim.pack.add { gh 'lukas-reineke/indent-blankline.nvim' }
require('ibl').setup {}

vim.pack.add { gh 'razak17/tailwind-fold.nvim' }
require('tailwind-fold').setup {}

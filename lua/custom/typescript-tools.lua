local gh = require('utils').gh

vim.pack.add { gh 'pmizio/typescript-tools.nvim' }
require('typescript-tools').setup {}

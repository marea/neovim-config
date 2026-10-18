local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'tpope/vim-dadbod' } }
vim.pack.add { { src = gh 'kristijanhusak/vim-dadbod-completion' } }
vim.pack.add { { src = gh 'kristijanhusak/vim-dadbod-ui' } }

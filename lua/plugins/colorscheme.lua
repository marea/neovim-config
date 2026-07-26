local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'keremimo/noctalia.nvim' }
---@diagnostic disable-next-line: missing-fields
require('noctalia').setup {
  transparent = true,
  dim_inactive = true,
  styles = {
    comments = { italic = false },
  },
}

vim.cmd.colorscheme 'noctalia'

-- vim: ts=2 sts=2 sw=2 et

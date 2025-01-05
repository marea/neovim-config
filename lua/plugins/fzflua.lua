return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    local builtin = require 'fzf-lua'

    vim.keymap.set(
      'n',
      '<leader>sh',
      builtin.helptags,
      { desc = '[S]earch [H]elp' }
    )
    vim.keymap.set(
      'n',
      '<leader>sk',
      builtin.keymaps,
      { desc = '[S]earch [K]eymaps' }
    )
    vim.keymap.set(
      'n',
      '<leader>sf',
      builtin.files,
      { desc = '[S]earch [F]iles' }
    )
    vim.keymap.set(
      'n',
      '<leader>ss',
      builtin.builtin,
      { desc = '[S]earch [S]elect Telescope' }
    )
    vim.keymap.set(
      'n',
      '<leader>sw',
      builtin.grep_cword,
      { desc = '[S]earch current [W]ord' }
    )
    vim.keymap.set(
      'n',
      '<leader>sg',
      builtin.live_grep,
      { desc = '[S]earch by [G]rep' }
    )
    vim.keymap.set(
      'n',
      '<leader>sd',
      builtin.diagnostics_document,
      { desc = '[S]earch [D]iagnostics' }
    )
    vim.keymap.set(
      'n',
      '<leader>sr',
      builtin.resume,
      { desc = '[S]earch [R]esume' }
    )
    vim.keymap.set(
      'n',
      '<leader>s.',
      builtin.oldfiles,
      { desc = '[S]earch Recent Files ("." for repeat)' }
    )
    vim.keymap.set(
      'n',
      '<leader><leader>',
      builtin.buffers,
      { desc = '[ ] Find existing buffers' }
    )

    vim.keymap.set(
      'n',
      '<leader>/',
      builtin.lgrep_curbuf,
      { desc = '[/] Fuzzily search in current buffer' }
    )

    vim.keymap.set(
      'n',
      '<leader>s/',
      builtin.live_grep,
      { desc = '[S]earch [/] in Open Files' }
    )

    vim.keymap.set('n', '<leader>sn', function()
      builtin.files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}

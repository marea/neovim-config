vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-flutter/flutter-tools.nvim',
  'https://github.com/sidlatau/flutter-icons.nvim',
}

require('flutter-tools').setup {
  fvm = true,
}
require('flutter-icons').setup {}

-- bootstrap lazy.nvim, LazyVim and your plugins
local original_select = vim.ui.select
vim.ui.select = function(...)
  -- Force load fzf-lua on first call
  require("lazy").load({ plugins = { "fzf-lua" } })
  local opts = require("lazy.core.plugin").values(require("lazy.core.config").plugins["fzf-lua"], "opts", false)
  require("fzf-lua").register_ui_select(opts.ui_select or nil)
  -- Call the newly registered vim.ui.select
  return vim.ui.select(...)
end

require("config.lazy")

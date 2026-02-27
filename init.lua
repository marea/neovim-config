-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  group = vim.api.nvim_create_augroup("toggle_bg_on_SIGUSR1", {}),
  callback = function()
    package.loaded.theme = nil
    vim.cmd.colorscheme("custom")
    vim.schedule(function()
      -- without this, nvim window need to be focused for the effect take into account
      vim.cmd("redraw!")
    end)
  end,
  nested = true, -- allow this autocmd to trigger `OptionSet background` event
})

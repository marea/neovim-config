---@diagnostic disable:undefined-global
local augroup = vim.api.nvim_create_augroup("godot", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gd",
  group = augroup,
  callback = function()
    local map = vim.keymap.set

    map(
      "n",
      "<F4>",
      ":GodotRunLast<CR>",
      { buffer = 0, desc = "Run last scene" }
    )
    map("n", "<F5>", ":GodotRun<CR>", { buffer = 0, desc = "Run main scene" })
    map(
      "n",
      "<F6>",
      ":GodotRunCurrent<CR>",
      { buffer = 0, desc = "Run current scene" }
    )
    map(
      "n",
      "<F7>",
      ":GodotRunCurrent<CR>",
      { buffer = 0, desc = "Search and run scene" }
    )
  end,
})

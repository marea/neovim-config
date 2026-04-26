vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>zz", function()
  vim.o.scrolloff = 999 - vim.o.scrolloff
end, { desc = "Toggle scroll center" })

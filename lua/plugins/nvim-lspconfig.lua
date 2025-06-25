return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        settings = {
          codeActionOnSave = {
            enable = true,
          },
        },
      },
    },
  },
}

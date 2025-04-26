return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {
        filetypes = { "html", "templ" },
      },
      tailwindcss = {
        filetypes = { "templ", "javascript", "typescript" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              templ = "html",
            },
          },
        },
      },
    },
  },
}

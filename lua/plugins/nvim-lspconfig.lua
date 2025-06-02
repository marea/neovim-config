local nvim_lsp = require("lspconfig")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ts_ls = {
        root_dir = nvim_lsp.util.root_pattern("package.json"),
        single_file_support = false,
      },
      denols = {
        filetypes = { "typescript", "typescriptreact" },
        root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
      },
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

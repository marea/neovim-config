return {
  {
    "g0ne150/java-deps.nvim",
    dependencies = {
      "folke/snacks.nvim",
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "vscode-java-dependency" } },
      },
    },
    config = function() end,
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Use LazyVim's safe utility function
      local java_deps_path = LazyVim.get_pkg_path(
        "vscode-java-dependency",
        "/extension/server/com.microsoft.jdtls.ext.core-*.jar",
        { warn = false }
      )

      -- Add a custom jdtls option that will be merged with the config
      opts.jdtls = opts.jdtls or {}
      opts.jdtls.init_options = opts.jdtls.init_options or {}
      opts.jdtls.init_options.bundles = opts.jdtls.init_options.bundles or {}

      -- Add the java-deps jar to bundles
      for _, bundle in ipairs(vim.split(vim.fn.glob(java_deps_path), "\n")) do
        if bundle ~= "" then
          table.insert(opts.jdtls.init_options.bundles, bundle)
        end
      end
    end,
  },
}

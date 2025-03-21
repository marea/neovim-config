return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvim-java/nvim-java',
    'folke/neoconf.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup(
        'kickstart-lsp-attach',
        { clear = true }
      ),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(
            mode,
            keys,
            func,
            { buffer = event.buf, desc = 'LSP: ' .. desc }
          )
        end

        map(
          'gd',
          --require('telescope.builtin').lsp_definitions,
          require('fzf-lua').lsp_definitions,
          '[G]oto [D]efinition'
        )
        map(
          'gr',
          --require('telescope.builtin').lsp_references,
          require('fzf-lua').lsp_references,
          '[G]oto [R]eferences'
        )
        map(
          'gI',
          --require('telescope.builtin').lsp_implementations,
          require('fzf-lua').lsp_implementations,
          '[G]oto [I]mplementation'
        )
        map(
          '<leader>D',
          --require('telescope.builtin').lsp_type_definitions,
          require('fzf-lua').lsp_typedefs,
          'Type [D]efinition'
        )
        map(
          '<leader>ds',
          --require('telescope.builtin').lsp_document_symbols,
          require('fzf-lua').lsp_document_symbols,
          '[D]ocument [S]ymbols'
        )
        map(
          '<leader>ws',
          --require('telescope.builtin').lsp_dynamic_workspace_symbols,
          require('fzf-lua').lsp_live_workspace_symbols,
          '[W]orkspace [S]ymbols'
        )
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map(
          '<leader>ca',
          --vim.lsp.buf.code_action,
          require('fzf-lua').lsp_code_actions,
          '[C]ode [A]ction',
          { 'n', 'x' }
        )
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client
          and client.supports_method(
            vim.lsp.protocol.Methods.textDocument_documentHighlight
          )
        then
          local highlight_augroup = vim.api.nvim_create_augroup(
            'kickstart-lsp-highlight',
            { clear = false }
          )
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup(
              'kickstart-lsp-detach',
              { clear = true }
            ),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds {
                group = 'kickstart-lsp-highlight',
                buffer = event2.buf,
              }
            end,
          })
        end

        if
          client
          and client.supports_method(
            vim.lsp.protocol.Methods.textDocument_inlayHint
          )
        then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
            )
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    if vim.g.have_nerd_font then
      local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
      local diagnostic_signs = {}
      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end
      vim.diagnostic.config { signs = { text = diagnostic_signs } }
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      'force',
      capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    -- Enable the following language servers, They will automatically be installed.
    -- Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    local servers = {
      -- clangd = {},
      gopls = {},
      -- jdtls = {},
      rust_analyzer = {},
      ts_ls = {},

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
            workspace = {
              library = {
                '${3rd}/love2d/library',
              },
            },
          },
        },
      },
    }

    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('neoconf').setup {}

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            'force',
            {},
            capabilities,
            server.capabilities or {}
          )
          require('lspconfig')[server_name].setup(server)
        end,
        jdtls = function()
          require('java').setup {
            -- Your custom jdtls settings goes here
          }
          require('lspconfig').jdtls.setup {
            -- Your custom nvim-java configuration goes here
          }
        end,
        ts_ls = function()
          local mason_registry = require 'mason-registry'
          local vue_language_server_path = mason_registry
            .get_package('vue-language-server')
            :get_install_path() .. '/node_modules/@vue/language-server'

          require('lspconfig').ts_ls.setup {
            init_options = {
              plugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = vue_language_server_path,
                  languages = { 'vue' },
                },
              },
            },
            filetypes = {
              'typescript',
              'javascript',
              'javascriptreact',
              'typescriptreact',
              'vue',
            },
          }
        end,
      },
    }
  end,
}

return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    -- This is where all the LSP shenanigans will live
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    --- if you want to know more about lsp-zero and mason.nvim
    --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
      lsp_zero.buffer_autoformat()

      -- diagnostic
      vim.diagnostic.config({
        virtual_text = false -- { prefix = '', },
      })
    end)

    -- keymaps
    vim.keymap.set('n', '<leader>qa', vim.lsp.buf.code_action)
    vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
    vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end)

    -- -- You must make sure volar is setup
    -- require 'lspconfig'.volar.setup {}

    local mason_registry = require("mason-registry")
    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'ts_ls' },
      handlers = {
        lsp_zero.default_setup,
        ['eslint'] = function()
          lspconfig.eslint.setup({
            -- capabilities = capabilities,
            flags = { debounce_text_changes = 500 },
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = true
              if client.server_capabilities.documentFormattingProvider then
                local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
                vim.api.nvim_create_autocmd("BufWritePre", {
                  pattern = "*",
                  -- callback = function()
                  --   vim.lsp.buf.format({})
                  -- end,
                  command = 'silent! EslintFixAll',
                  group = au_lsp,
                })
              end
            end,
          })
        end,
        ['lua_ls'] = function()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          }
        end,
        ['ts_ls'] = function()
          local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
              .. "/node_modules/@vue/language-server"

          lspconfig.ts_ls.setup {
            settings = {
              diagnostics = {
                globals = { "_" },
              },
            },
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path,
                  languages = { "vue" },
                },
              },
            },
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "vue",
            },
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          }
        end,
        ['volar'] = function()
          local typescript_language_server_path = mason_registry.get_package("typescript-language-server")
              :get_install_path()
              .. "/node_modules/typescript/lib"
          lspconfig.volar.setup {
            init_options = {
              typescript = {
                tsdk = typescript_language_server_path,
              },
              vue = {
                hybrideMode = false
              }
            },
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          }
        end
      }
    })
  end
}

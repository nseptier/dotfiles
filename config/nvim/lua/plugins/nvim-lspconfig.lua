return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason-lspconfig").setup_handlers {
      function(name)
        if name ~= 'volar' and name ~= 'eslint' then
          vim.lsp.enable(name)
        end
      end,
    }

    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- vim.lsp.config('eslint', {
    --   on_attach = function()
    --     vim.keymap.set('n', '[e',
    --       function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
    --     vim.keymap.set('n', ']e',
    --       function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end)
    --   end,

    --   root_dir = function()
    --     return vim.loop.cwd()
    --   end,
    -- })

    -- vim.lsp.config('volar', {
    --   init_options = {
    --     vue = {
    --       hybrideMode = false
    --     }
    --   },
    --   on_attach = function(client)
    --     vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })
    --     client.server_capabilities.documentFormattingProvider = false
    --     client.server_capabilities.documentRangeFormattingProvider = false
    --   end
    -- })

    vim.lsp.config('ts_ls', {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      },

      on_attach = function(client, bufnr)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })

    vim.lsp.config('lua_ls', {
      on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    local lspconfig = require('lspconfig')

    require('mason-lspconfig').setup({
      handlers = {

        ['eslint'] = function()
          lspconfig.eslint.setup({
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = true
              if client.server_capabilities.documentFormattingProvider then
                local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
                vim.api.nvim_create_autocmd("BufWritePre", {
                  pattern = "*",
                  command = 'silent! EslintFixAll',
                  group = au_lsp,
                })
              end
            end,
          })
        end,

        ['volar'] = function()
          lspconfig.volar.setup({
            init_options = {
              vue = {
                hybrideMode = false,
              },
            },
            on_attach = function(client)
              vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
          })
        end,

      }
    })
  end
}

return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    require("mason-lspconfig").setup_handlers {
      function(name)
        vim.lsp.enable(name)
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

    local mason_registry = require 'mason-registry'
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
        '/node_modules/@vue/language-server'

    local function show_global_code_actions(client)
      local source_actions = vim.tbl_filter(function(action)
        return vim.startswith(action, 'source.')
      end, client.server_capabilities.codeActionProvider.codeActionKinds)

      vim.lsp.buf.code_action({
        context = {
          only = source_actions,
        },
      })
    end

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

      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },

        preferences = {
          allowRenameOfImportPath = true,
          allowTextChangesInNewFiles = true,
          importModuleSpecifierEnding = 'minimal',
          importModuleSpecifierPreference = 'non-relative',
          includeAutomaticOptionalChainCompletions = true,
          includeCompletionsForImportStatements = true,
          includeCompletionsForModuleExports = true,
          includeCompletionsWithClassMemberSnippets = true,
          includeCompletionsWithInsertText = true,
          includeCompletionsWithObjectLiteralMethodSnippets = true,
          includeCompletionsWithSnippetText = true,
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          interactiveInlayHints = true,
          organizeImportsIgnoreCase = true,
          provideRefactorNotApplicableReason = true,
          quotePreference = 'single',
          useLabelDetailsInCompletionEntries = true,
        },

      },

      on_attach = function(client, bufnr)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
        vim.keymap.set({ 'n', 'v' }, '<leader>cA', function() show_global_code_actions(client) end)

        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,

      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
    })

    vim.lsp.config('lua_ls', {
      on_attach = function(client, bufnr)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })

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

    vim.lsp.config('eslint', {
      on_attach = function()
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })
      end,

      settings = {
        codeActionOnSave = {
          enable = true,
          mode = "all"
        },
      },
    })

    vim.lsp.config('volar', {
      on_attach = function(client)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = true })

        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })
  end
}

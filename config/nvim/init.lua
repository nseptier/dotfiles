-- resize windows when host window size changes
local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })
vim.api.nvim_create_autocmd('VimResized', {
  group = wr_group,
  pattern = '*',
  command = 'wincmd =',
})

--------------------------------------------------------------------------------
-- keymaps
--------------------------------------------------------------------------------

-- alias fugitive to lowercase g
vim.cmd('cnoreabbrev g G')

-- Set space as leader key
vim.keymap.set('n', '<space><nop>', vim.lsp.buf.rename)
vim.g.mapleader = " "

-- rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- code actions
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Map jj to esc insert mode in terminal
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { silent = true })

-- buffers navigation
vim.keymap.set('', '[b', ':bprevious<cr>', { silent = true })
vim.keymap.set('', ']b', ':bnext<cr>', { silent = true })

-- tabs navigation
vim.keymap.set('', '[t', ':tabprevious<cr>', { silent = true })
vim.keymap.set('', ']t', ':tabnext<cr>', { silent = true })

-- quickfix list navigation
vim.keymap.set('', '[q', ':cprev<cr>', { silent = true })
vim.keymap.set('', ']q', ':cnext<cr>', { silent = true })

-- Open Oil
vim.keymap.set('n', '<leader>oo', ':Oil<cr>', { silent = true, nowait = true })

-- delete buffer
vim.keymap.set('n', '<leader>qq', ':lua MiniBufremove.delete()<cr>', { silent = true, nowait = true })

-- delete all hidden buffers
vim.keymap.set('n', '<leader>Q', ':DeleteHiddenBuffers<cr>', { silent = true })

-- quit nvim
vim.api.nvim_create_user_command('SaveAllandQuit', 'wall | qa!', {})
vim.keymap.set('n', 'QQ', ':SaveAllandQuit<cr>', { silent = true, nowait = true })

-- Remove search highlights
vim.keymap.set('n', '<esc><esc>', ':noh<cr>', { silent = true })

-- Others
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })

--------------------------------------------------------------------------------
-- options
--------------------------------------------------------------------------------

vim.o.autoindent = true
vim.o.autoread = true
vim.o.backupdir = vim.fn.expand('~/.vim/backup/')
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 1
vim.o.compatible = false
vim.o.cursorcolumn = false
vim.o.cursorline = true
vim.o.directory = vim.fn.expand('~/.vim/swap/')
vim.o.encoding = 'utf-8'
vim.o.expandtab = true
vim.o.fillchars =
'eob: ,fold:⧸,foldopen:,foldclose:,foldsep: ,horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋'
vim.o.foldcolumn = 'auto'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'expr'
vim.o.foldnestmax = 20
vim.opt.foldopen:remove 'block'
vim.o.foldtext = ''
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.lcs = 'tab:|→'
vim.o.list = true
vim.o.listchars = 'eol:↲,tab:→ ,trail:×,precedes:‹,extends:›,nbsp:␣,space: '
vim.o.number = true
vim.o.path = '$PWD/**'
vim.o.relativenumber = true
vim.opt.rtp:append '/usr/local/opt/fzf'
vim.o.ruler = true
vim.o.scrolloff = 2
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.signcolumn = 'no'
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 1000
vim.o.undodir = vim.fn.expand('~/.vim/undo/')
vim.opt.wildignore:append '*/node_modules/**'
vim.o.wrap = false
vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize'

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

vim.api.nvim_create_autocmd('LspProgress', {
  callback = function(ev)
    -- vim.print(ev)

    if ev.data.params.value.kind == 'end' and ev.data.params.token == 'TSSERVER_LOADING' then
      local seen = {}

      vim.tbl_map(function(winid)
        local bufnr = vim.api.nvim_win_get_buf(winid)

        if not seen[bufnr] and vim.lsp.buf_is_attached(bufnr, ev.data.client_id) then
          vim.api.nvim_buf_call(bufnr, function()
            vim.lsp.semantic_tokens.force_refresh(0)
          end)
          seen[bufnr] = true
        end
      end, vim.api.nvim_tabpage_list_wins(0))
    end
  end,
})


--------------------------------------------------------------------------------
-- lazy.nvim
--------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

--------------------------------------------------------------------------------
-- git commits
--------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("Filetype", {
  callback = function()
    vim.o.textwidth = 72
  end,
  pattern = 'gitcommit'
})

--------------------------------------------------------------------------------
-- colorscheme
--------------------------------------------------------------------------------

vim.cmd 'color ipsum'

--------------------------------------------------------------------------------
-- autocmd
--------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("Filetype", {
  callback = function()
    vim.o.cursorline = false
  end,
  pattern = 'TelescopePrompt'
})

-- Force typescriptreact filetype
vim.api.nvim_create_autocmd(
  'TermOpen',
  {
    callback = function()
      vim.o.number = false
      vim.o.relativenumber = false
    end
  }
)

vim.api.nvim_create_autocmd(
  'BufEnter',
  {
    callback = function()
      vim.cmd("startinsert")
    end,
    pattern = "term://*",
  }
)

-- Force typescriptreact filetype
vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' },
  {
    -- pattern = { '*.js', '*.ts', '*.jsx', '*.tsx' },
    pattern = { '*.js', '*.jsx', '*.tsx' },
    callback = function()
      vim.o.filetype = 'typescript.tsx'
    end
  }
)

-- Show cursor line for active buffer only
vim.api.nvim_create_autocmd(
  { 'WinEnter' },
  {
    pattern = '*',
    callback = function()
      vim.wo.cursorline = true
    end
  }
)
vim.api.nvim_create_autocmd(
  { 'WinLeave' },
  {
    pattern = '*',
    callback = function()
      vim.wo.cursorline = false
    end
  }
)

--------------------------------------------------------------------------------
-- Misc
--------------------------------------------------------------------------------

-- diagnostics options

vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end)

vim.diagnostic.config({
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
  signs = {
    numhl = {
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  virtual_text = false,
  -- virtual_text = {
  --   source = "if_many",
  --   prefix = '● ',
  -- },
})

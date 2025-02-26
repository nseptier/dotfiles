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

-- function ClearTerm()
--   vim.opt_local.scrollback = 1

--   vim.api.nvim_command("startinsert")
--   vim.api.nvim_feedkeys("clear", 't', false)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 't', true)

--   vim.opt_local.scrollback = 10000
-- end

-- vim.keymap.set('t', 'zz', '<c-\\><c-n>:lua ClearTerm()<cr>')

-- alias fugitive to lowercase g
vim.cmd('cnoreabbrev g G')

-- Set space as leader key
vim.keymap.set('n', '<space><nop>', vim.lsp.buf.rename)
vim.g.mapleader = " "

-- rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- code actions
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Map jj to esc
-- vim.keymap.set('i', 'jj', '<esc>', { silent = true })

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

-- Sort selection
vim.keymap.set('v', '<leader>s', ':sort i<cr>', { silent = true })

-- delete buffer
vim.keymap.set('n', '<leader>qq', ':Bdelete!<cr>', { silent = true, nowait = true })

-- delete all hidden buffers
vim.keymap.set('n', '<leader>Q', ':DeleteHiddenBuffers<cr>', { silent = true })

-- quit nvim
vim.api.nvim_create_user_command('SaveAllandQuit', 'wall | qa!', {})
vim.keymap.set('n', 'QQ', ':SaveAllandQuit<cr>', { silent = true, nowait = true })

-- local bufs = vim.api.nvim_list_bufs()
-- for _, i in ipairs(bufs) do
--   if i ~= current_buf then
--     vim.api.nvim_buf_delete(i, {})
--   end
-- end

-- Remove search highlights
vim.keymap.set('n', '<esc><esc>', ':noh<cr>', { silent = true })

-- Others
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })

--------------------------------------------------------------------------------
-- options
--------------------------------------------------------------------------------

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backupdir = '/c/Users/nsepier/.vim/backup/'
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.compatible = false
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.directory = '~/.vim/swap//'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fillchars = 'fold:-,vert: '
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- vim.opt.foldmethod = 'syntax'
vim.opt.foldnestmax = 20
vim.opt.foldopen:remove 'block'
vim.opt.foldtext = ''
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.lcs = 'tab:|→'
vim.opt.list = true
vim.opt.listchars = 'eol:↲,tab:→ ,trail:×,precedes:‹,extends:›,nbsp:~,space: '
vim.opt.number = true
vim.opt.path = '$PWD/**'
vim.opt.relativenumber = true
vim.opt.rtp:append '/usr/local/opt/fzf'
vim.opt.ruler = true
vim.opt.scrolloff = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.signcolumn = 'no'
vim.opt.shell = 'bash'
vim.opt.shellcmdflag = '-c'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''
vim.opt.shellslash = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = '~/.vim/undo//'
vim.opt.wildignore:append '*/node_modules/**'
vim.opt.wrap = false

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
    vim.opt.textwidth = 72
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

vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    -- check if treesitter has parser
    if require("nvim-treesitter.parsers").has_parser() then
      -- use treesitter folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      -- use alternative foldmethod
      vim.opt.foldmethod = "indent"
    end
  end,
})

-- Force typescriptreact filetype
vim.api.nvim_create_autocmd(
  'TermOpen',
  {
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
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
    pattern = { '*.js', '*.ts', '*.jsx', '*.tsx' },
    callback = function()
      vim.opt_local.filetype = 'typescriptreact'
    end
  }
)

-- Show cursor line for active buffer only
vim.api.nvim_create_autocmd(
  'WinEnter',
  {
    pattern = '*',
    callback = function()
      vim.wo.cursorline = true
    end
  }
)
vim.api.nvim_create_autocmd(
  'WinLeave',
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
vim.diagnostic.config({
  signs = {
    numhl = {
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
    },
  },
  virtual_text = {
    source = "if_many",
    prefix = '● ',
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
})

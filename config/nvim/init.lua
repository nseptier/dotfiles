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

-- Set space as leader key
vim.keymap.set('n', '<space><nop>', vim.lsp.buf.rename)
vim.g.mapleader = " "

-- rename
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- code actions
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

-- Map jj to esc
vim.keymap.set('i', 'jj', '<esc>', { silent = true })

-- Map jj to esc insert mode in terminal
vim.keymap.set('t', 'jj', '<c-\\><c-n>', { silent = true })

-- buffers navigation
vim.keymap.set('', '[b', ':bprevious<cr>', { silent = true })
vim.keymap.set('', ']b', ':bnext<cr>', { silent = true })

-- tabs navigation
vim.keymap.set('', '[t', ':tabprevious<cr>', { silent = true })
vim.keymap.set('', ']t', ':tabnext<cr>', { silent = true })

-- quickfix list navigation
vim.keymap.set('', '[q', ':cprev<cr>', { silent = true })
vim.keymap.set('', ']q', ':cnext<cr>', { silent = true })

-- Sort selection
vim.keymap.set('v', '<leader>s', ':sort i<cr>', { silent = true })

-- delete buffer
vim.keymap.set('n', '<leader>q', ':Bdelete!<cr>', { silent = true, nowait = true })

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
vim.opt.backupdir = '~/.vim/backup//'
vim.opt.clipboard = 'unnamed'
vim.opt.cmdheight = 1
vim.opt.compatible = false
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.directory = '~/.vim/swap//'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fillchars = 'fold:-,vert:▏'
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'
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
vim.opt.showtabline = 2
vim.opt.signcolumn = 'no'
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
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", })
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

-- Force typescriptreact filetype
local hl_group = vim.api.nvim_create_augroup('hl', { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' },
  {
    group = hl_group,
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
    -- group = hl_group,
    pattern = '*',
    callback = function()
      vim.wo.cursorline = true
    end
  }
)
vim.api.nvim_create_autocmd(
  'WinLeave',
  {
    -- group = hl_group,
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

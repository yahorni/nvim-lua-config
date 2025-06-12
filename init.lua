-- vim: ts=2 sts=2 sw=2 et fdm=marker fdl=0

-- {{{ [[ Options ]]

-- leader/localleader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
-- colortheme
vim.o.background = 'dark' -- 'dark'/'light'
-- status line
vim.opt.laststatus = 2
-- encoding/fileformat
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,cp1251,koi8-r,ucs-2,cp866'
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.endofline = true
-- search
vim.opt.incsearch = true
vim.opt.hlsearch = true -- can cause slowdown in huge files
-- preview substitutions live, as you type
vim.opt.inccommand = 'split'
-- case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- tab/space
vim.opt.tabstop = 4 -- width for Tab
vim.opt.shiftwidth = 4 -- width for shifting with '>>'/'<<'
vim.opt.softtabstop = 4 -- width for Tab in inserting or deleting (Backspace)
vim.opt.smarttab = true
vim.opt.expandtab = true
-- indentation
vim.opt.autoindent = true
vim.opt.breakindent = true
-- nonprintable characters
vim.opt.list = true
-- eol = '↲' - doesn't work in raw terminal
vim.opt.listchars = { eol = '↲', tab = '> ', trail = '·', nbsp = '␣', extends = '>', precedes = '<' }
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true -- can cause slowdown
-- info/swap/backup
vim.opt.shadafile = 'NONE'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false
-- modeline
vim.opt.modeline = true
vim.opt.modelines = 5
-- messages in last line
vim.opt.showmode = false
vim.opt.showcmd = true -- can cause slowdown
-- wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,full'
-- mouse
vim.opt.mouse = 'a'
-- folding
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true
-- conceal
vim.opt.conceallevel = 0
vim.opt.concealcursor = 'nvic'
-- tags
vim.opt.tags = './tags,tags,~/.local/share/tags'
vim.opt.tagrelative = false -- disable directory prefix for tag file
-- spell
vim.opt.spell = true
vim.opt.spelllang = ''
-- file search
vim.opt.path:append '**'
vim.opt.wildignore:append '*/build/*,*/.git/*,*/node_modules/*'
--  enable system clipboard
vim.opt.clipboard = 'unnamedplus'
-- minimal lines before/after cursor
vim.opt.scrolloff = 5
-- do not autoreload changed file
vim.opt.autoread = false
-- highlight current line
vim.opt.cursorline = true -- can cause slowdown
-- do not indent: N-s - namespaces, g0 - public/private/protected
vim.opt.cinoptions = 'N-s,g0'
-- enable <> pair
vim.opt.matchpairs:append '<:>'
-- do not save quickfix to session file
vim.opt.sessionoptions:remove 'blank,folds'
-- enable local .vimrc/.nvim.lua
vim.opt.exrc = false
-- shorten vim messages
vim.opt.shortmess = 'atT'
-- text width
vim.opt.textwidth = 120
vim.opt.colorcolumn = '+0' -- can cause slowdown
-- window title
vim.opt.title = true -- causes nvim to black screen in raw console
-- make buffer hidden when it's abandoned
vim.opt.hidden = true
-- keep signcolumn on
vim.opt.signcolumn = 'yes'
-- do show extra information about the currently selected completion
-- vim.opt.completeopt:remove "preview"
-- TODO: test all options below
-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
-- extended color support
vim.opt.termguicolors = true -- makes everything ugly in raw console

--- }}}

-- {{{ [[ Commands ]]

vim.cmd 'com! W :w'
vim.cmd 'com! -bang W :w<bang>'
vim.cmd 'com! Q :q'
vim.cmd 'com! -bang Q :q<bang>'
vim.cmd 'com! Wq :wq'
vim.cmd 'com! -bang Wq :wq<bang>'
vim.cmd 'com! WQ :wq'
vim.cmd 'com! -bang WQ :wq<bang>'
vim.cmd 'com! Qa :qa'
vim.cmd 'com! -bang Qa :qa<bang>'
vim.cmd 'com! QA :qa'
vim.cmd 'com! -bang QA :qa<bang>'

vim.cmd 'com! Vs :vs'
vim.cmd 'com! VS :vs'
vim.cmd 'com! Sp :sp'
vim.cmd 'com! SP :sp'

-- }}}

-- {{{ [[ Keymaps ]]

-- disable some keys before plugins
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<nop>')
vim.keymap.set({ 'n', 'i' }, '<F1>', '<nop>')

-- change <paste> command behaviour
vim.keymap.set('x', 'p', '"_dp', { noremap = true })
vim.keymap.set('x', 'P', '"_dP', { noremap = true })
-- disable highlight
vim.keymap.set('n', '<leader>H', '<cmd>noh<cr>', { noremap = true })
-- copy til EOL with Y
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
-- quit
vim.keymap.set('n', 'zq', 'ZQ', { noremap = true })
-- buffer close
vim.keymap.set('n', '<C-q>', '<cmd>close<cr>', { noremap = true })
-- update file and search
vim.keymap.set('n', '<A-n>', '<cmd>e<cr>n', { noremap = true })
vim.keymap.set('n', '<A-N>', '<cmd>e<cr>N', { noremap = true })

-- tabs
vim.keymap.set('n', 'gt', '<nop>')
vim.keymap.set('n', 'gth', '<cmd>tabprev<cr>', { noremap = true, desc = 'Previous tab' })
vim.keymap.set('n', 'gtl', '<cmd>tabnext<cr>', { noremap = true, desc = 'Next tab' })
vim.keymap.set('n', 'gtt', function()
  local current_file = vim.api.nvim_buf_get_name(0)
  return '<cmd>tabnew' .. (current_file == '' and '' or ' %') .. '<cr>'
end, { noremap = true, expr = true, desc = 'Create new tab (same as current)' })
vim.keymap.set('n', 'gtc', '<cmd>tabclose<cr>', { noremap = true, desc = 'Close tab' })
vim.keymap.set('n', 'gtH', '<cmd>tabmove -1<cr>', { noremap = true, desc = 'Move tab to the left' })
vim.keymap.set('n', 'gtL', '<cmd>tabmove +1<cr>', { noremap = true, desc = 'Move tab to the right' })
-- switch to tab by number
vim.keymap.set('n', '<leader>1', '1gt', { noremap = true })
vim.keymap.set('n', '<leader>2', '2gt', { noremap = true })
vim.keymap.set('n', '<leader>3', '3gt', { noremap = true })
vim.keymap.set('n', '<leader>4', '4gt', { noremap = true })
vim.keymap.set('n', '<leader>5', '5gt', { noremap = true })
vim.keymap.set('n', '<leader>6', '6gt', { noremap = true })
vim.keymap.set('n', '<leader>7', '7gt', { noremap = true })
vim.keymap.set('n', '<leader>8', '8gt', { noremap = true })
vim.keymap.set('n', '<leader>9', '9gt', { noremap = true })
vim.keymap.set('n', '<leader>0', '<cmd>tablast<cr>', { noremap = true, silent = true })

-- file execution
vim.keymap.set('n', '<leader>cb', ':!compiler.sh build "%"<cr>', { noremap = true, desc = '[C]ode [B]uild' })
vim.keymap.set('n', '<leader>cr', ':!compiler.sh run "%"<cr>', { noremap = true, desc = '[C]ode [R]un' })
vim.keymap.set('n', '<leader>co', ':!compiler.sh other "%"<cr>', { noremap = true, desc = '[C]ode [O]ther action' })

-- file permissions
vim.keymap.set('n', '<leader>xa', ':!chmod +x %<cr>', { noremap = true, desc = '[A]dd e[X]ecutable permissions' })
vim.keymap.set('n', '<leader>xr', ':!chmod -x %<cr>', { noremap = true, desc = '[R]emove e[X]ecutable permissions' })

-- search visually selected text with '//'
vim.cmd [[ vn // y/\V<C-R>=escape(@",'/\')<cr><cr> ]]
-- replace visually selected text
vim.cmd [[ vn <leader>S y:%s/<C-R>+//g<Left><Left> ]]

-- remove trailing whitespaces
vim.cmd [[ nn <leader>xw :%s/\s\+$//e <bar> nohl<cr> ]]
vim.cmd [[ vn <leader>xw y:'<,'>s/\s\+$//e <bar> nohl<cr> ]]
-- remove empty lines
vim.cmd [[ nn <leader>xe :g/^$/d <bar> nohl<cr> ]]
vim.cmd [[ vn <leader>xe y:'<,'>g/^$/d <bar> nohl<cr> ]]
-- squish consecutive duplicate lines
vim.cmd [[ nn <leader>xl :%s;\v^(.*)(\n\1)+$;\1;<cr> ]]
-- remove swaps
vim.cmd [[ nn <leader>xs :!rm -f ~/.local/state/nvim/swap/*<cr> ]]

-- }}}

-- {{{ [[ Diagnostics ]]

-- keymaps
vim.keymap.set('n', '<leader>dn', vim.diagnostic.enable, { desc = 'Enable diagnostic messages' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.disable, { desc = 'Disable diagnostic messages' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- virtual lines
vim.diagnostic.config { virtual_lines = { current_line = true } }

-- }}}

-- {{{ [[ Plugins ]]

-- `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- configure plugins
require('lazy').setup('plugins', {
  change_detection = { notify = false },
})

-- }}}

-- {{{ [[ Split/resize ]]

local function toggle_resize_mode()
  if vim.g.resize_mode then
    vim.g.resize_mode = nil
    vim.print 'Resize mode disabled'
  else
    vim.g.resize_mode = true
    vim.print 'Resize mode enabled'
  end
end
vim.keymap.set('n', '<leader>xt', toggle_resize_mode, { silent = true, desc = '[R]esize buffer' })

-- Ctrl+h/j/k/l bindings
vim.keymap.set(
  'n',
  '<C-h>',
  "!exists('g:resize_mode') ? '<C-w><C-h>' : ':vert res -1<cr>'",
  { silent = true, expr = true, noremap = true, desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  "!exists('g:resize_mode') ? '<C-w><C-j>' : ':res -1<cr>'",
  { silent = true, expr = true, noremap = true, desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  "!exists('g:resize_mode') ? '<C-w><C-k>' : ':res +1<cr>'",
  { silent = true, expr = true, noremap = true, desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  "!exists('g:resize_mode') ? '<C-w><C-l>' : ':vert res +1<cr>'",
  { silent = true, expr = true, noremap = true, desc = 'Move focus to the upper window' }
)

-- }}}

-- {{{ [[ Session ]]
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()

  if current_file == '' then
    current_dir = cwd
  else
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    return
  end
  return git_root
end

local function set_session_file()
  local git_root = find_git_root()
  if git_root then
    vim.g.session_file = git_root .. '/.session.vim'
  else
    vim.g.session_file = '.session.vim'
  end
end
set_session_file()

vim.keymap.set(
  'n',
  '<leader>m',
  '<cmd>mksession! ' .. vim.g.session_file .. ' <bar> echo "Session saved to ' .. vim.g.session_file .. '"<cr>',
  { silent = true }
)
vim.keymap.set('n', '<leader>l', '<cmd>source ' .. vim.g.session_file .. '<cr>', { silent = true })
vim.keymap.set('n', '<leader>R', function()
  vim.fn.system { 'rm', vim.g.session_file }
  vim.print 'Session removed'
end, { silent = true })

-- }}}

-- {{{ [[ Autocmds ]]

-- custom ft styles
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'javascript', 'yaml', 'markdown', 'text', 'json', 'typst' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitconfig', 'make', 'just' },
  callback = function()
    vim.opt_local.expandtab = false
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'ledger', 'markdown', 'typst', 'AvanteInput' },
  callback = function()
    vim.bo.textwidth = 0
  end,
})
-- highlight on yank `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- }}}

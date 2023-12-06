-- Set leader/localleader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- disable some keys
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<nop>')

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- improved quoting/parenthesizing
  'tpope/vim-surround',
  -- dot command for vim-surround
  'tpope/vim-repeat',
  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- rename files
  'vim-scripts/Rename2',

  -- Uncomment for debug logs (use :MasonLog)
  -- { 'williamboman/mason.nvim', settings = { log_level = vim.log.levels.DEBUG } },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { 'folke/neodev.nvim',    opts = {} },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
        vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame,
          { buffer = bufnr, desc = 'Toggle current line blame' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    init = function()
      vim.keymap.set('n', '<C-_>', function()
        return vim.v.count == 0 and '<Plug>(comment_toggle_linewise_current)' or '<Plug>(comment_toggle_linewise_count)'
      end, { expr = true })
      vim.keymap.set('n', '<leader><C-_>', function()
        return vim.v.count == 0 and '<Plug>(comment_toggle_blockwise_current)' or
            '<Plug>(comment_toggle_blockwise_count)'
      end, { expr = true })
      vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')
      vim.keymap.set('x', '<leader><C-_>', '<Plug>(comment_toggle_blockwise_visual)')
    end,
    opts = {
      mappings = { basic = true, extra = false },
      post_hook = function()
        vim.api.nvim_feedkeys('j', 't', false)
      end,
    },
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    -- TODO: how to make exclusions for project
    -- TODO: pass telescope results to quickfix
    -- TODO: ignore *.log files by default
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Switch language keymap in insert mode
  {
    'lyokha/vim-xkbswitch',
    init = function()
      vim.g.XkbSwitchEnabled = 1
      vim.g.XkbSwitchLib = '/usr/lib/libxkbswitch.so'
    end,
  },

  { import = 'plugins' },
}, {})

-- [[ Setting options ]]
-- status line
vim.o.laststatus = 2
-- encoding/fileformat
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,cp1251,ucs-2,koi8-r,cp866'
vim.o.fileformat = 'unix'
vim.o.fileformats = 'unix,dos,mac'
vim.o.endofline = true
-- search
vim.o.incsearch = true
vim.o.hlsearch = true -- can cause slowdown in huge files
-- case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- tab/space
vim.o.tabstop = 4     -- width for Tab
vim.o.shiftwidth = 4  -- width for shifting with '>>'/'<<'
vim.o.softtabstop = 4 -- width for Tab in inserting or deleting (Backspace)
vim.o.smarttab = true
vim.o.expandtab = true
-- indentation
vim.o.autoindent = true
vim.o.breakindent = true
-- nonprintable characters
vim.o.list = true
vim.opt.listchars = { tab = '> ', trail = '·' }
-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true -- can cause slowdown
-- info/swap/backup
vim.o.shadafile = 'NONE'
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = false
-- modeline
vim.o.modeline = true
vim.o.modelines = 5
-- messages in last line
vim.o.showmode = false
vim.o.showcmd = true -- can cause slowdown
-- wildmenu
vim.o.wildmenu = true
vim.o.wildmode = 'longest,full'
-- mouse
vim.o.mouse = 'a'
-- folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
-- splits
vim.o.splitbelow = true
vim.o.splitright = true
-- conceal
vim.o.conceallevel = 0
vim.o.concealcursor = 'nvic'
-- tags
vim.o.tags = './tags,tags,~/.local/share/tags'
vim.o.tagrelative = false -- disable directory prefix for tag file
-- spell
vim.o.spell = true
vim.o.spelllang = ''
-- file search
vim.opt.path:append '**'
vim.opt.wildignore:append '*/build/*,*/.git/*,*/node_modules/*'
--  enable system clipboard
vim.o.clipboard = 'unnamedplus'
-- minimal lines before/after cursor
vim.o.scrolloff = 5
-- do not autoreload changed file
vim.o.autoread = false
-- highlight current line
vim.o.cursorline = true -- can cause slowdown
-- do not indent: N-s - namespaces, g0 - public/private/protected
vim.o.cinoptions = 'N-s,g0'
-- enable <> pair
vim.opt.matchpairs:append '<:>'
-- do not save quickfix to session file
vim.opt.sessionoptions:remove 'blank,folds'
-- enable local .vimrc/.nvim.lua
vim.o.exrc = true
-- shorten vim messages
vim.o.shortmess = 'atT'
-- text width
vim.o.textwidth = 120
vim.o.colorcolumn = 120
-- window title
vim.o.title = true
-- make buffer hidden when it's abandoned
vim.o.hidden = true
-- keep signcolumn on
vim.wo.signcolumn = 'yes'
-- do show extra information about the currently selected completion
-- vim.opt.completeopt:remove "preview"
-- TODO: test all options below
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- extended color support
vim.o.termguicolors = true

-- [[ Custom commands ]]
vim.cmd 'com! W :w'
vim.cmd 'com! Q :q'
vim.cmd 'com! Wq :wq'
vim.cmd 'com! WQ :wq'
vim.cmd 'com! Qa :qa'
vim.cmd 'com! QA :qa'
vim.cmd 'com! -bang Q :q<bang>'
vim.cmd 'com! -bang Wq :wq<bang>'
vim.cmd 'com! -bang WQ :wq<bang>'
vim.cmd 'com! -bang Qa :qa<bang>'
vim.cmd 'com! -bang QA :qa<bang>'
vim.cmd 'com! Vs :vs'
vim.cmd 'com! VS :vs'
vim.cmd 'com! Sp :sp'
vim.cmd 'com! SP :sp'

-- [[ Basic Keymaps ]]
-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- change <paste> command behaviour
vim.keymap.set('x', 'p', '"_dp', { noremap = true })
vim.keymap.set('x', 'P', '"_dP', { noremap = true })
-- disable highlight
vim.keymap.set('n', '<leader>h', '<cmd>noh<CR>', { noremap = true })
-- copy til EOL with Y
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
-- quit
vim.keymap.set('n', 'zq', 'ZQ', { noremap = true })
-- buffer close
vim.keymap.set('n', '<C-q>', '<cmd>close<CR>', { noremap = true })
-- update file and search
vim.keymap.set('n', '<A-n>', '<cmd>e<CR>n', { noremap = true })
vim.keymap.set('n', '<A-N>', '<cmd>e<CR>N', { noremap = true })

-- [[ Split/resizing ]]
local function toggle_resize_mode()
  if vim.g.resize_mode then
    vim.g.resize_mode = nil
    vim.print 'Resize mode disabled'
  else
    vim.g.resize_mode = true
    vim.print 'Resize mode enabled'
  end
end
vim.keymap.set('n', 'gR', toggle_resize_mode)

-- Ctrl+h/j/k/l bindings
vim.keymap.set('n', '<C-h>', "!exists('g:resize_mode') ? '<C-w><C-h>' : ':vert res -1<CR>'",
  { silent = true, expr = true, noremap = true })
vim.keymap.set('n', '<C-j>', "!exists('g:resize_mode') ? '<C-w><C-j>' : ':res -1<CR>'",
  { silent = true, expr = true, noremap = true })
vim.keymap.set('n', '<C-k>', "!exists('g:resize_mode') ? '<C-w><C-k>' : ':res +1<CR>'",
  { silent = true, expr = true, noremap = true })
vim.keymap.set('n', '<C-l>', "!exists('g:resize_mode') ? '<C-w><C-l>' : ':vert res +1<CR>'",
  { silent = true, expr = true, noremap = true })

-- [[ Tabs ]]
vim.keymap.set('n', 'gt', '<nop>')
vim.keymap.set('n', 'gth', '<cmd>tabprev<CR>', { noremap = true, desc = 'Previous tab' })
vim.keymap.set('n', 'gtl', '<cmd>tabnext<CR>', { noremap = true, desc = 'Next tab' })
vim.keymap.set('n', 'gtt', function()
  local current_file = vim.api.nvim_buf_get_name(0)
  return '<cmd>tabnew' .. (current_file == '' and '' or ' %') .. '<CR>'
end, { noremap = true, expr = true, desc = 'Create new tab (same as current)' })
vim.keymap.set('n', 'gtc', '<cmd>tabclose<CR>', { noremap = true, desc = 'Close tab' })
vim.keymap.set('n', 'gtH', '<cmd>tabmove -1<CR>', { noremap = true, desc = 'Move tab to the left' })
vim.keymap.set('n', 'gtL', '<cmd>tabmove +1<CR>', { noremap = true, desc = 'Move tab to the right' })

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
vim.keymap.set('n', '<leader>0', '<cmd>tablast<CR>', { noremap = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = { 'node_modules', 'extras' },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
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

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root and vim.fn.getcwd() or git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('v', '<leader>gg', 'y:Telescope live_grep default_text=<C-r>0<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>gg', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })

-- [[ Session handling ]]
local function set_session_file()
  local git_root = find_git_root()
  if git_root then
    if vim.fn.isdirectory(git_root .. '/.ide') ~= 0 then
      vim.g.session_file = git_root .. '/.ide/session.vim'
    else
      vim.g.session_file = git_root .. '/session.vim'
    end
  else
    vim.g.session_file = 'session.vim'
  end
end
set_session_file()

vim.keymap.set(
  'n',
  '<leader>m',
  '<cmd>mksession! ' .. vim.g.session_file .. ' <bar> echo "Session saved to ' .. vim.g.session_file .. '"<CR>',
  { silent = true }
)
vim.keymap.set('n', '<leader>l', '<cmd>source ' .. vim.g.session_file .. '<CR>', { silent = true })
vim.keymap.set('n', '<leader>R', function()
  vim.fn.system { 'rm', vim.g.session_file }
  vim.print 'Session removed'
end, { silent = true })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'vim', 'bash' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('<leader>f', '<cmd>Format<cr>', 'Format code')
  -- python: isort, autoflake, autopep8
  -- c/c++: clang-format
  -- json: fixjson
  -- html/css/js: prettier
  -- sh: shfmt
end

-- document existing key chains
require('which-key').register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>p'] = { name = 'More git', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  clangd = {},
  gopls = {},
  cmake = {},
  -- able to run with nodejs 16 (default on ubuntu_18: nodejs 8)
  pyright = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
  ['clangd'] = function()
    require('lspconfig').clangd.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.keymap.set('n', '<leader>o', '<cmd>ClangdSwitchSourceHeader<cr>',
          { buffer = bufnr, desc = 'Switch Source/Header (C/C++)' })
      end,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- completion = {
  --   completeopt = 'menu,menuone,noinsert'
  -- },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- [[ Misc ]]

-- custom ft styles
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'javascript', 'yaml', 'markdown', 'text' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitconfig', 'make' },
  callback = function()
    vim.bo.expandtab = false
  end,
})

-- file execution
vim.keymap.set('n', '<leader>ce', ':!compiler %<CR>', { noremap = true, desc = '[C]ode [E]xecution' })
vim.keymap.set('n', '<leader>cr', ':!compiler run %<CR>', { noremap = true, desc = '[C]ode [R]un' })
vim.keymap.set('n', '<leader>cR', ':!compiler other %<CR>', { noremap = true, desc = '[C]ode [O]ther action' })

-- file permissions
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>', { noremap = true, desc = 'Add e[x]ecutable permissions' })
vim.keymap.set('n', '<leader>X', ':!chmod -x %<CR>', { noremap = true, desc = 'Remove e[X]ecutable permissions' })

-- search visually selected text with '//'
vim.cmd [[ vn // y/\V<C-R>=escape(@",'/\')<CR><CR> ]]

-- replace visually selected text
vim.cmd [[ vn <leader>S y:%s/<C-R>+//g<Left><Left> ]]
vim.cmd [[ nn <silent> <leader>W :%s/\s\+$//e <bar> nohl<CR> ]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

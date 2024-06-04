return {
  -- improved quoting/parenthesizing
  'tpope/vim-surround',
  -- dot command for vim-surround
  'tpope/vim-repeat',
  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- rename files
  'tpope/vim-eunuch',

  -- Uncomment for debug logs (use :MasonLog)
  -- { 'williamboman/mason.nvim', settings = { log_level = vim.log.levels.DEBUG } },

  { -- Switch language keymap in insert mode
    'lyokha/vim-xkbswitch',
    init = function()
      vim.g.XkbSwitchEnabled = 1
      vim.g.XkbSwitchLib = '/usr/lib/libxkbswitch.so'
    end,
  },

  { -- Text/tables aligning
    -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
    -- align by '=': Tabularize /=
    'godlygeek/tabular',
    init = function()
      vim.keymap.set('v', '<leader>t', ':Tabularize /', { silent = false, noremap = true })
    end,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
      -- document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      }
      -- visual mode
      require('which-key').register({
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })
    end,
  },
}

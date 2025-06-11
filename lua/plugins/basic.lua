return {
  -- improved quoting/parenthesizing
  'tpope/vim-surround',
  -- dot command for vim-surround
  'tpope/vim-repeat',
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
      vim.keymap.set('v', '<leader>T', ':Tabularize /|<cr>', { silent = false, noremap = true, desc = 'Tabularize by symbol' })
      vim.keymap.set('n', '<leader>T', 'vap:Tabularize /|<cr>', { silent = false, noremap = true, desc = 'Format markdown [t]able' })
    end,
  },

  { -- Show pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
      -- document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument', mode = { 'n', 'v' } },
        { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
      }
    end,
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
}

return {
  -- improved quoting/parenthesizing
  'tpope/vim-surround',
  -- dot command for vim-surround
  'tpope/vim-repeat',
  -- rename files
  'tpope/vim-eunuch',

  { -- ledger
    'ledger/vim-ledger',
    init = function()
      vim.g['ledger_fuzzy_account_completion'] = 1
    end
  },

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
    event = 'VeryLazy',
    opts = {
      spec = {
        -- { "<leader>c", group = "[C]ode", desc = "which_key_ignore" },
        { "<leader>g", desc = "[G]it" },
        -- ["<leader>g"] = { desc = "[G]it" },
        -- ["<leader>g"] = { desc = "git" },
    --     { "<leader>h", group = "Git [H]unk", desc = "which_key_ignore" },
    --     { "<leader>r", group = "[R]ename", desc = "which_key_ignore" },
    --     { "<leader>s", group = "[S]earch", desc = "which_key_ignore" },
    --     { "<leader>w", group = "[W]orkspace", desc = "which_key_ignore" },
      }
    },
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
      -- document existing key chains
      require('which-key').add {
        -- { "<leader>c", group = "[C]ode", desc = "which_key_ignore" },
        { '<leader>c', group = "[C]ode" },
        { '<leader>d', group = '[D]elete', mode = {'n', 'v'} },
        { '<leader>g', group = '[G]it', mode = {'n', 'v'} },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
      }
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}

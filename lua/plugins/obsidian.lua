-- obsidian.nvim

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = { 'markdown', 'ledger' },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre ~/dox/obsidian/**.md',
    'BufNewFile ~/dox/obsidian/**.md',
    'BufReadPre ~/dox/obsidian/**.ledger',
    'BufNewFile ~/dox/obsidian/**.ledger',
  },

  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'nvim-telescope/telescope.nvim', -- search and quick-switch
    'nvim-treesitter/nvim-treesitter', -- markdown syntax highlight
  },

  cmd = {
    'ObsidianQuickSwitch',
    'ObsidianNew',
    'ObsidianToday',
    'ObsidianTomorrow',
    'ObsidianYesterday',
    'ObsidianSearch',
    'ObsidianOpen',
  },

  keys = {
    { '<localleader><localleader>q', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian Quick Search' },
    { '<localleader><localleader>n', '<cmd>ObsidianNew<cr>', desc = 'Obsidian New' },
    { '<localleader><localleader>d', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
    { '<localleader><localleader>t', '<cmd>ObsidianToday +1<cr>', desc = 'Obsidian Tomorrow' },
    { '<localleader><localleader>y', '<cmd>ObsidianToday -1<cr>', desc = 'Obsidian Yesterday' },
    { '<localleader><localleader>s', '<cmd>ObsidianSearch<cr>', desc = 'Obsidian Search' },
    { '<localleader><localleader>o', '<cmd>ObsidianOpen<cr>', desc = 'Obsidian Open' },
    { '<localleader><localleader>b', '<cmd>ObsidianBacklinks<cr>', desc = 'Obsidian Backlinks' },
  },

  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '~/dox/obsidian',
      },
    },

    daily_notes = {
      folder = tostring(os.date '10 personal/11 journal/%Y-%m %B'),
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      title_format = '%B %-d, %Y',
      template = '00 system/05 templates/daily-nvim.md',
    },

    templates = {
      folder = '00 system/05 templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {
        week = function()
          return os.date('%Y-W%W', os.time())
        end,
      },
    },

    ui = { enable = false, },
    disable_frontmatter = false,

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      local out = { aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    follow_url_func = function(url)
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      vim.ui.open(url) -- need Neovim 0.10.0+
    end,

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
       end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = 'telescope.nvim',
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      mappings = {
        -- Create a new note from your query.
        new = '<C-x>',
        -- Insert a link to the selected note.
        insert_link = '<C-l>',
      },
    },
  },
}

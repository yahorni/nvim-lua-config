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
    'hrsh7th/nvim-cmp', -- completion
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
  },

  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '~/dox/obsidian',
      },
    },

    daily_notes = {
      folder = tostring(os.date 'daily/%B %Y'),
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      title_format = '%B %-d, %Y',
      template = 'templates/daily_nvim.md',
    },

    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },

    disable_frontmatter = false,

    note_id_func = function(title)
      if title ~= nil then
        return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      end

      local suffix = ''
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
      return tostring(os.time()) .. '-' .. suffix
    end,

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

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
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
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

    ui = {
      enable = false,
      checkboxes = {
        ['*'] = { order = 0, char = '*', hl_group = 'ObsidianImportant' },
        [' '] = { order = 1, char = ' ', hl_group = 'ObsidianTodo' },
        ['/'] = { order = 2, char = '/', hl_group = 'ObsidianInProgress' },
        ['x'] = { order = 3, char = 'x', hl_group = 'ObsidianDone' },
      },
    },
  },
}

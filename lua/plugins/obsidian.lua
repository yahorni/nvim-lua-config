return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = { "markdown", "ledger" },
  event = {
    "BufReadPre ~/dox/notes/**.md",
    "BufNewFile ~/dox/notes/**.md",
    "BufReadPre ~/dox/notes/**.ledger",
    "BufNewFile ~/dox/notes/**.ledger",
  },
  dependencies = { "nvim-lua/plenary.nvim" },

  cmd = { "ObsidianQuickSwitch", "ObsidianToday", "ObsidianSearch" },

  opts = {
    workspaces = {
      { name = "notes", path = "~/dox/notes" },
      { name = "job", path = "~/dox/job" },
    },

    ui = { enable = false },
    disable_frontmatter = false,
    picker = { name = "fzf-lua" },
    backlinks = { parse_headers = true },
    mappings = {
      ["<localleader>q"] = {
        action = "<cmd>ObsidianQuickSwitch<cr>",
        opts = { desc = "Open quick switcher" },
      },
      ["<localleader>d"] = {
        action = "<cmd>ObsidianToday<cr>",
        opts = { desc = "Open today's note" },
      },
      ["<localleader>y"] = {
        action = "<cmd>ObsidianToday -1<cr>",
        opts = { desc = "Open yesterday's note" },
      },
      ["<localleader>t"] = {
        action = "<cmd>ObsidianToday +1<cr>",
        opts = { desc = "Open tomorrow's note" },
      },
      ["<localleader>s"] = {
        action = "<cmd>ObsidianSearch<cr>",
        opts = { desc = "Open fuzzy search" },
      },
      -- Smart action depending on context:
      -- follow link, show notes with tag, toggle checkbox, or toggle heading fold
      ["<cr>"] = {
        action = function() return require("obsidian").util.smart_action() end,
        opts = { buffer = true, expr = true },
      },
    },

    follow_url_func = function(url) vim.ui.open(url) end,

    daily_notes = {
      folder = tostring(os.date("10 personal/11 journal/%Y-%m %B")),
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      title_format = "%B %-d, %Y",
      template = "daily-nvim.md",
    },

    templates = {
      folder = "~/dox/notes/00 system/05 templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {
        week = function() return os.date("%Y-W%W", os.time()) end,
      },
    },

    note_frontmatter_func = function(note)
      local out = { aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}

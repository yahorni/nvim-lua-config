local notes = require("custom/notes")

return {
  {
    "yahorni/simple-calendar.nvim",
    config = function()
      local calendar = require("simple-calendar")
      calendar.setup({ path_pattern = notes.journal_path_pattern(), highlight_unfinished_tasks = true })
      vim.keymap.set("n", "<leader>cc", calendar.show_calendar, { desc = "Open [C]alendar" })
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    event = {
      "BufReadPre " .. notes.dir .. "/*.md",
      "BufNewFile " .. notes.dir .. "/*.md",
    },
    cmd = "Obsidian",

    opts = {
      workspaces = {
        { name = "notes", path = notes.dir },
      },

      completion = { blink = false, nvim_cmp = false, create_new = false },
      ui = { enable = false },
      picker = { name = "fzf-lua" },
      backlinks = { parse_headers = false },
      checkbox = { order = { " ", "/", "x", "!" } },
      legacy_commands = false,

      callbacks = {
        enter_note = function()
          vim.keymap.set("n", "<localleader>d", "<cmd>Obsidian today<cr>",
                         { buffer = true, desc = "Open [D]aily note" })
          vim.keymap.set("n", "<localleader>t", "<cmd>Obsidian tomorrow<cr>",
                         { buffer = true, desc = "Open [T]omorrow's note" })
          vim.keymap.set("n", "<localleader>y", "<cmd>Obsidian yesterday<cr>",
                         { buffer = true, desc = "Open [Y]esterday's note" })
          vim.keymap.set("n", "<localleader>T", "<cmd>Obsidian template<cr>",
                         { buffer = true, desc = "Select note [T]emplate" })
          vim.keymap.set("n", "<localleader>b", "<cmd>Obsidian backlinks<cr>",
                         { buffer = true, desc = "Show [B]acklinks" })
          vim.keymap.set("n", "<localleader>r", "<cmd>Obsidian rename<cr>",
                         { buffer = true, desc = "[R]ename note" })
          vim.keymap.set("n", "<localleader>#", "<cmd>Obsidian tags<cr>",
                         { buffer = true, desc = "[R]ename note" })
        end,
      },

      daily_notes = {
        folder = tostring(os.date(notes.journal_dir)),
        date_format = notes.date_format,
        alias_format = "%B %-d, %Y",
        template = "daily-nvim.md",
        workdays_only = false,
      },

      templates = {
        folder = notes.templates_dir,
        date_format = notes.date_format,
        time_format = "%H:%M",
      },

      frontmatter = {
        func = function(note)
          local out = { tags = note.tags }
          if #note.aliases ~= 0 then
            out["aliases"] = note.aliases
          end
          -- `note.metadata` contains any manually added fields in the frontmatter.
          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end
          return out
        end,
      },
    },
  },
}

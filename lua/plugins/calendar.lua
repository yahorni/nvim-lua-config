return {
  "yahorni/simple-calendar.nvim",
  config = function()
    local calendar = require("simple-calendar")
    calendar.setup({
      daily_path_pattern = require("private.notes").journal_path_pattern(),
      highlight_unfinished_tasks = true,
    })

    vim.keymap.set("n", "<localleader>c", calendar.show_calendar, { noremap = true, desc = "show [c]alendar" })
    vim.keymap.set("n", "<localleader>d", calendar.journal, { noremap = true, desc = "open [d]aily note" })
    vim.keymap.set("n", "<localleader>t", function() calendar.journal(1) end,
                   { noremap = true, desc = "open [t]omorrow's daily note" })
    vim.keymap.set("n", "<localleader>y", function() calendar.journal(-1) end,
                   { noremap = true, desc = "open [y]esterday's daily note" })

    vim.api.nvim_create_user_command(
      "Journal",
      function(opts)
        local offset = 0
        local arg = opts.fargs[1]
        if arg then
          if arg == "tomorrow" then
            offset = 1
          elseif arg == "yesterday" then
            offset = -1
          end
        end
        calendar.journal(offset)
      end,
      { nargs = "?" })
  end,
}

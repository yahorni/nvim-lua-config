return {
  "yahorni/simple-calendar.nvim",
  config = function()
    local calendar = require("simple-calendar")
    calendar.setup({
      daily_path_pattern = require("private.notes").journal_path_pattern(),
      highlight_unfinished_tasks = true,
    })

    vim.keymap.set("n", "<localleader>c", calendar.open, { noremap = true, desc = "open [c]alendar" })
    vim.keymap.set("n", "<localleader>d", calendar.journal, { noremap = true, desc = "open to[d]ay's note" })
    vim.keymap.set("n", "<localleader>t", function() calendar.journal("tomorrow") end,
                   { noremap = true, desc = "open [t]omorrow's daily note" })
    vim.keymap.set("n", "<localleader>y", function() calendar.journal("yesterday") end,
                   { noremap = true, desc = "open [y]esterday's daily note" })

    vim.api.nvim_create_user_command("Journal", calendar.journal, { nargs = "?" })
  end,
}

return {
  "yahorni/simple-calendar.nvim",
  config = function()
    local calendar = require("simple-calendar")
    calendar.setup({
      daily_path_pattern = require("private.notes").journal_path_pattern(),
      highlight_unfinished_tasks = true,
    })
    vim.keymap.set("n", "<localleader>c", calendar.show_calendar, { desc = "Open [C]alendar" })
  end,
}

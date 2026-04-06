local m = require("simple-calendar")
local success, n = pcall(require, "notes")
if success then
  m.setup({
    daily_path_pattern = n.journal_path_pattern(),
    highlight_unfinished_tasks = true,
  })
end

vim.keymap.set("n", "<localleader>c", m.open, { noremap = true, desc = "open [c]alendar" })
vim.keymap.set("n", "<localleader>d", m.journal, { noremap = true, desc = "open to[d]ay's note" })
vim.keymap.set("n", "<localleader>t", function() m.journal("tomorrow") end,
               { noremap = true, desc = "open [t]omorrow's daily note" })
vim.keymap.set("n", "<localleader>y", function() m.journal("yesterday") end,
               { noremap = true, desc = "open [y]esterday's daily note" })

vim.api.nvim_create_user_command("Journal", m.journal, { nargs = "?" })

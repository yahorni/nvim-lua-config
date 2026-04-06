local m = require("which-key")
m.setup({
  spec = {
    { "<leader>c",      group = "[c]ode" },
    { "<leader>d",      group = "[d]iagnostics" },
    { "<leader>g",      group = "[g]it" },
    { "<leader>s",      group = "[s]earch" },
    { "<leader>f",      group = "[f]ile search" },
    { "<localleader>g", group = "[g]itsigns" },
  },
})

vim.keymap.set("n", "<leader>?", function() m.show() end, { desc = "global keymaps" })
vim.keymap.set("n", "<localleader>?", function() m.show({ global = false }) end, { desc = "buffer local keymaps" })

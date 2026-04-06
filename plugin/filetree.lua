local m = require("mini.files")
m.setup({ mappings = { go_in = "L", go_in_plus = "l" } })

vim.keymap.set(
  "n", "<C-N>",
  function()
    m.open(vim.api.nvim_buf_get_name(0))
    m.reveal_cwd()
  end,
  { desc = "open mini.files and reveal file" }
)

return {
  "nvim-mini/mini.files",
  version = false,
  opts = { mappings = { go_in = "L", go_in_plus = "l" } },
  config = function(_, opts)
    local m = require("mini.files")
    m.setup(opts)
    vim.keymap.set(
      "n", "<C-n>",
      function()
        m.open(vim.api.nvim_buf_get_name(0))
        m.reveal_cwd()
      end,
      { desc = "Open mini.files and reveal file" })
  end,
}

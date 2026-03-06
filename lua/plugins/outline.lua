return {
  "hedyhli/outline.nvim",
  config = function()
    vim.keymap.set("n", "<leader>ot", "<Cmd>Outline!<CR>", { desc = "[o]utline [t]oggle" })
    vim.keymap.set("n", "<leader>of", "<Cmd>OutlineFocus<CR>", { desc = "switch [o]utline/source code [f]ocus" })
    require("outline").setup()
  end,
}

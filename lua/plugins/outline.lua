return {
  "hedyhli/outline.nvim",
  config = function()
    vim.keymap.set("n", "<leader>tt", "<cmd>Outline!<CR>", { desc = "[t]oggle ou[t]line" })
    vim.keymap.set("n", "<leader>tf", "<cmd>OutlineFocus<CR>",
      { desc = "swi[t]ch [f]ocus between outline and source windows" })
    require("outline").setup()
  end,
}

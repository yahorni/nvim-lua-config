return {
  "hedyhli/outline.nvim",
  config = function()
    vim.keymap.set("n", "<leader>tt", "<cmd>Outline!<CR>", { desc = "Toggle outline" })
    vim.keymap.set("n", "<leader>tf", "<cmd>OutlineFocus<CR>", { desc = "Switch between outline and source windows" })
    require("outline").setup()
  end,
}

return {
  "godlygeek/tabular", -- text/tables aligning
  init = function()
    vim.keymap.set("v", "<leader>T", ":Tabularize /|<cr>",
                   { silent = true, noremap = true, desc = "Tabularize by symbol" })
    vim.keymap.set("n", "<leader>T", "vap:Tabularize /|<cr>",
                   { silent = true, noremap = true, desc = "Format markdown [t]able" })
  end,
}

return { -- text/tables aligning
  -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
  -- align by '=': Tabularize /=
  "godlygeek/tabular",
  init = function()
    vim.keymap.set(
      "v",
      "<leader>T",
      ":Tabularize /|<cr>",
      { silent = false, noremap = true, desc = "Tabularize by symbol" }
    )
    vim.keymap.set(
      "n",
      "<leader>T",
      "vap:Tabularize /|<cr>",
      { silent = false, noremap = true, desc = "Format markdown [t]able" }
    )
  end,
}

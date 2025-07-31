return {
  "yahorni/vim-ledger",
  ft = { "ledger" },
  init = function()
    vim.g["ledger_fuzzy_account_completion"] = 1
    vim.bo.textwidth = 0
  end,
}

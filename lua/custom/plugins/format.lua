return {
  {
    'mhartington/formatter.nvim',
    opts = {
      filetype = {
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        cmake = { 'cmake-format' },
        python = { 'isort', 'autopep8' },
        json = { 'jq' },
        ["*"] = { 'codespell', 'remove_trailing_whitespace' }
      }
    },
    init = function()
      vim.keymap.set('n', '<C-f>', '<cmd>FormatWrite<CR>', { noremap = true, silent = true })
    end,
  }
}

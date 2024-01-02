return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim' },
    },
    config = function()
      local lint = require 'lint'

      -- 'cppcheck', 'clangtidy' - fail with exit code 1
      lint.linters_by_ft = {
        cpp = { 'cpplint', 'flawfinder' },
        c = { 'cpplint', 'flawfinder' },
        python = { 'flake8', 'pylint', 'mypy' },
        cmake = { 'cmakelint' },
        sh = { 'shellcheck' },
        json = { 'jsonlint' }, -- jq
        markdown = { 'markdownlint' },
        ['*'] = { 'write-good' },
      }

      local linters = require('lint').linters
      table.insert(linters.cpplint.args, '--linelength=120')
      table.insert(linters.cmakelint.args, '--linelength=120')
      table.insert(linters.flake8.args, '--max-line-length=120')
      table.insert(linters.pylint.args, '--max-line-length=120')
      table.insert(linters.mypy.args, '--ignore-missing-imports')

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}

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
      -- TODO: disable flawfinder complains about tabs
      lint.linters_by_ft = {
        cpp = { 'cpplint', 'flawfinder' },
        -- c = { 'flawfinder' },
        python = { 'flake8', 'pylint', 'mypy' },
        cmake = { 'cmakelint' },
        sh = { 'shellcheck' },
        json = { 'jsonlint' }, -- jq
        markdown = { 'markdownlint' },
      }

      local linters = require('lint').linters
      -- check if there are default args:
      -- ~/.local/share/nvim/lazy/nvim-lint/lua/lint/linters/<linter-name>.lua

      table.insert(linters.cpplint.args, '--linelength=120')
      table.insert(linters.cmakelint.args, '--linelength=120')
      table.insert(linters.flake8.args, '--max-line-length=120')
      table.insert(linters.mypy.args, '--ignore-missing-imports')

      -- https://pylint.pycqa.org/en/latest/user_guide/checkers/features.html
      table.insert(linters.pylint.args, '--max-line-length=120')
      table.insert(linters.pylint.args, '--disable=missing-module-docstring')
      table.insert(linters.pylint.args, '--disable=missing-class-docstring')
      table.insert(linters.pylint.args, '--disable=missing-function-docstring')
      table.insert(linters.pylint.args, '--disable=unspecified-encoding')

      -- https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md
      linters.markdownlint.args = { '--disable',  'MD013',  '--'}

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-lint",
    },
    opts = {
      automatic_installation = false  -- enable when setting up repository
    }
  }
}

return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim' },
    },
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        -- Try to cover those with LSP
        -- cpp = {'cpplint', 'cppcheck', 'flawfinder'}, -- clangtidy
        -- c = {'cpplint', 'cppcheck', 'flawfinder'}, -- clangtidy
        -- python = {'flake8', 'pylint'},
        -- cmake = {'cmakelint'},
        --
        sh = {'shellcheck'},
        tex = {'chktex'},
        json = {'jsonlint'}, -- jq
        xml = {'xmllint'},
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end
  }
}

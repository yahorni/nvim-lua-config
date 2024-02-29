return {
  {
    'stevearc/conform.nvim',
    keys = {
      {
        '<C-f>',
        function()
          require('conform').format { lsp_fallback = true }
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        cmake = { 'cmake-format' },
        python = { 'isort', 'autoflake', 'autopep8' },
        sh = { 'shfmt' },     -- shellcheck, shellharden
        json = { 'fixjson' }, -- jq
        markdown = { 'markdownlint' },
        xml = { 'xmlformatter' },
        lua = { 'stylua' },
        html = { 'prettier' },
        css = { 'prettier' },
        javascript = { 'prettier' }, -- clang-format
        ['*'] = { 'codespell', 'trim_whitespace', 'trim_newlines' },
      },
      formatters = {
        autopep8 = {
          prepend_args = { '--max-line-length=120' },
        },
      },
    },
  },
}

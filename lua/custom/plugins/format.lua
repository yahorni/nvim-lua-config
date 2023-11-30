return {
  {
    'stevearc/conform.nvim',
    keys = {
      { "<C-f>", function() require("conform").format({ lsp_fallback = true }) end },
    },
    opts = {
      formatters_by_ft = {
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        cmake = { 'cmake-format' },
        python = { 'isort', 'autoflake', 'autopep8' },
        sh = { 'shfmt' }, -- shellcheck, shellharden
        lua = { 'stylua' },
        json = { 'jq' }, -- fixjson
        xml = { 'xmlformat' },
        ['*'] = { 'codespell', 'trim_whitespace', 'trim_newlines' }
      }
    }
  }
}

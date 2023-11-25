return {
  {
    'mfussenegger/nvim-lint',
    -- TODO: make linters work
    linters_by_ft = {
      cpp = {'cpplint', 'clangtidy', 'cppcheck', 'flawfinder'},
      c = {'cpplint', 'clangtidy', 'cppcheck', 'flawfinder'},
      cmake = {'cmakelint'},
      sh = {'shellcheck'},
      python = {'flake8', 'pylint'},
      tex = {'chktex'},
      json = {'jq'},
      xml = {'xmllint'},
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }
}

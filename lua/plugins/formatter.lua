return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<C-f>",
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
      c = { "clang-format" },
      cmake = { "cmake-format" },
      python = { "isort", "autoflake", "autopep8" },
      sh = { "shfmt" },
      json = { "fixjson" },
      markdown = { "markdownlint" },
      xml = { "xmlformatter" },
      lua = { "stylua" },
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      ["*"] = { "trim_whitespace", "trim_newlines" },
    },
    formatters = {
      autopep8 = {
        prepend_args = { "--max-line-length=120" },
      },
      fixjson = {
        prepend_args = { "--indent=2" },
      },
    },
  },
}

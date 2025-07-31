return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",
  },
  build = "make",
  opts = {
    provider = "deepseek",
    providers = {
      pplx = {
        __inherited_from = "openai",
        api_key_name = "PPLX_API_KEY",
        endpoint = "https://api.perplexity.ai",
        model = "r1-1776",
      },
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-coder",
      },
    },
  },
  config = function(_, opts)
    require("avante").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "AvanteInput",
      callback = function() vim.bo.textwidth = 0 end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "Avante",
      callback = function() vim.bo.filetype = "markdown" end,
    })
  end,
}

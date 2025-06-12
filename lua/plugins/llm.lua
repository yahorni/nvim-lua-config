return {
  'yetone/avante.nvim',
  -- https://github.com/Kaiser-Yang/blink-cmp-avante
  event = 'VeryLazy',
  version = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
  },
  build = 'make',
  opts = {
    -- provider = "pplx",
    provider = 'deepseek',
    vendors = {
      pplx = {
        __inherited_from = 'openai',
        api_key_name = 'PPLX_API_KEY',
        endpoint = 'https://api.perplexity.ai',
        model = 'r1-1776',
      },
      deepseek = {
        __inherited_from = 'openai',
        api_key_name = 'DEEPSEEK_API_KEY',
        endpoint = 'https://api.deepseek.com',
        model = 'deepseek-coder',
      },
    },
  },
}

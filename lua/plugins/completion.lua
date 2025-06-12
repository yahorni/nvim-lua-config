return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = {
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',
  },
  version = 'v0.*',

  opts = {
    keymap = {
      preset = 'none',

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'cancel', 'fallback' },
      ['<C-t>'] = { 'select_and_accept', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },

    completion = {
      menu = { draw = { treesitter = { 'lsp' } } },
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
      },
    },

    snippets = { preset = 'luasnip' },
    cmdline = { enabled = false },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    signature = { enabled = true },
  },
}

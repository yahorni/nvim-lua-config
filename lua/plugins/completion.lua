return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load { paths = { '~/.config/nvim/snippets' } }
      end,
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
  },
  version = 'v0.*',

  opts = {
    keymap = { preset = 'default' },
    -- <C-space>: 'show', 'show_documentation', 'hide_documentation'
    -- <C-e>: hide
    -- <C-y>: select_and_accept
    -- <C-p>: select_prev
    -- <C-n>: select_next
    -- <C-b>: scroll_documentation_up
    -- <C-f>: scroll_documentation_down
    -- <Tab>: snippet_forward
    -- <S-Tab>: snippet_backward

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },
    sources = { default = { 'lsp', 'path', 'luasnip', 'buffer' } },
    signature = { enabled = true },
  },
}

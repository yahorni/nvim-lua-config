return {
  'stevearc/aerial.nvim',
  -- event = "LazyFile",

  opts = {
    attach_mode = 'global',
    backends = { 'lsp', 'treesitter', 'markdown' },
    show_guides = true,
    layout = {
      resize_to_content = true,
      min_width = 30,
      win_opts = {
        winhl = 'Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB',
        signcolumn = 'yes',
        statuscolumn = ' ',
      },
    },
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set('n', '<leader>{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>T', '<cmd>AerialToggle!<CR>')
    end,
  },
}

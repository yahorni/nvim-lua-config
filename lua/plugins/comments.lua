return {
  {
    'numToStr/Comment.nvim',
    init = function()
      vim.keymap.set('n', '<C-_>', function()
        return vim.v.count == 0 and '<Plug>(comment_toggle_linewise_current)' or '<Plug>(comment_toggle_linewise_count)'
      end, { expr = true })
      vim.keymap.set('n', '<leader><C-_>', function()
        return vim.v.count == 0 and '<Plug>(comment_toggle_blockwise_current)' or
            '<Plug>(comment_toggle_blockwise_count)'
      end, { expr = true })
      vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')
      vim.keymap.set('x', '<leader><C-_>', '<Plug>(comment_toggle_blockwise_visual)')
    end,
    opts = {
      mappings = { basic = true, extra = false },
      post_hook = function()
        vim.api.nvim_feedkeys('j', 't', false)
      end,
    },
  }
}

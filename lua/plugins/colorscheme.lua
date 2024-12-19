return {
  {
    'morhetz/gruvbox',
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'sainnhe/sonokai',
    lazy = true,
    config = function()
      vim.cmd.colorscheme 'sonokai'
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    config = function()
      vim.cmd.colorscheme 'tokyonight'
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'catppuccin/nvim',
    lazy = true,
    background = {
      light = 'latte',
      dark = 'mocha',
    },
    styles = { comments = { 'italic' }, conditionals = { 'italic' } },
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}

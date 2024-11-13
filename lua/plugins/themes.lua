return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  -- The lowest priority is set as a colorscheme
  -- Make sure we load main colorscheme during startup
  {
    'sainnhe/sonokai',
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'sonokai'
    end,
  },
  { -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    lazy = true,
    priority = 999,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 998,
    config = function()
      vim.cmd.colorscheme 'tokyonight'
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'catppuccin/nvim',
    lazy = true,
    priority = 997,
    background = { -- :h background
      light = 'latte',
      dark = 'mocha',
    },
    styles = { comments = { 'italic' }, conditionals = { 'italic' } },
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 996,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}

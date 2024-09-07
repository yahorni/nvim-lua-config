return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  -- The lowest priority is set as a colorscheme
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
    'catppuccin/nvim',
    lazy = false,
    priority = 997,
    background = { -- :h background
      light = 'latte',
      dark = 'mocha',
    },
    styles = { comments = { 'italic' }, conditionals = { 'italic' } },
    config = function()
      -- vim.o.background = 'dark'
      vim.o.background = 'light'
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 996,
    config = function()
      -- vim.o.background = 'dark'
      vim.o.background = 'light'
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 998,
    config = function()
      vim.o.background = 'light'
      vim.cmd.colorscheme 'tokyonight'

      -- vim.o.background = 'dark'
      -- vim.cmd.colorscheme 'tokyonight-night'

      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

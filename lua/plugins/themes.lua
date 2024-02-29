return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  -- The lowest priority is set as a colorscheme
  {
    'sainnhe/sonokai',
    priority = 999,
    config = function()
      vim.cmd.colorscheme 'sonokai'
    end,
  },
  { -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1001,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

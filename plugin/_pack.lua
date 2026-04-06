-- plugins:   ~/.local/share/nvim/site/pack/core/opt/
-- lock file: ~/.config/nvim/nvim-pack-lock.json

vim.pack.add({
  "https://github.com/dcampos/nvim-snippy",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/hedyhli/outline.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/morhetz/gruvbox",
  "https://github.com/nvim-mini/mini.files",
  "https://github.com/yahorni/simple-calendar.nvim",
  "https://github.com/ivanesmantovich/xkbswitch.nvim",

  "https://github.com/tpope/vim-eunuch",   -- rename files
  "https://github.com/tpope/vim-surround", -- improved quoting/parenthesizing
  "https://github.com/tpope/vim-repeat",   -- dot command for vim-surround

  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",

  { src = "https://github.com/saghen/blink.cmp", version = "v1" },
})

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup({
      -- Location: ~/.local/share/nvim/lazy/nvim-treesitter/parser/
      ensure_installed = {
        "c",
        "cpp",
        "diff",
        "go",
        "lua",
        "python",
        "vim",
        "bash",
        "vimdoc",
        "kotlin",
        "markdown",
        "markdown_inline",
      },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

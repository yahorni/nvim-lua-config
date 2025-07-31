return {
  "stevearc/aerial.nvim",
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown" },
    filter_kind = false,
    show_guides = true,
    on_attach = function(bufnr)
      vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
      vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<cr>", { buffer = bufnr })
      vim.keymap.set("n", "<leader>t", "<cmd>AerialToggle!<cr>")
    end,
  },
}

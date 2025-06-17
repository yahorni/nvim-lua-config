return {
  "stevearc/aerial.nvim",

  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown" },
    show_guides = true,
    filter_kind = false,
    layout = {
      resize_to_content = true,
      min_width = 30,
      win_opts = {
        winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
        signcolumn = "yes",
        statuscolumn = " ",
      },
    },
    guides = {
      mid_item = "├╴",
      last_item = "└╴",
      nested_top = "│ ",
      whitespace = "  ",
    },
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
      vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<cr>", { buffer = bufnr })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>t", "<cmd>AerialToggle!<cr>")
    end,
  },
}

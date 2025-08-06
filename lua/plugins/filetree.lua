return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
    filesystem = {
      filtered_items = { visible = true },
      hijack_netrw_behavior = "open_current",
    },
    document_symbols = {
      follow_cursor = true,
      window = { mappings = { ["l"] = "toggle_node" } },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set("n", "<leader>n", "<cmd>Neotree position=current reveal toggle<cr>",
                   { desc = "Show file tree in current buffer" })
    vim.keymap.set("n", "<C-n>", "<cmd>Neotree reveal toggle<cr>",
                   { desc = "Show file tree in side bar" })
    vim.keymap.set("n", "<leader>t", "<cmd>Neotree document_symbols toggle<cr>",
                   { desc = "Show document symbols" })
    vim.keymap.set("n", "<leader>gn", "<cmd>Neotree git_status reveal toggle<cr>",
                   { desc = "Show changed files (git)" })
  end,
}

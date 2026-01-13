return {
  "folke/which-key.nvim", -- show pending keybinds
  event = "VeryLazy",
  config = function()
    require("which-key").setup()
    require("which-key").add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]ocument", mode = { "n", "v" } },
      { "<leader>g", group = "[G]it",      mode = { "n", "v" } },
      { "<leader>s", group = "[S]earch" },
      { "<leader>w", group = "[W]orkspace" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

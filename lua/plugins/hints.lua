return {
  "folke/which-key.nvim", -- show pending keybinds
  event = "VeryLazy",
  config = function()
    require("which-key").setup()
    require("which-key").add({
      { "<leader>c",      group = "[c]ode" },
      { "<leader>d",      group = "[d]iagnostics" },
      { "<leader>g",      group = "[g]it" },
      { "<leader>s",      group = "[s]earch" },
      { "<leader>f",      group = "[f]ile search" },
      { "<localleader>g", group = "[g]itsigns" },
    })
  end,
  keys = {
    { "<leader>?",      function() require("which-key").show() end,                   desc = "global keymaps" },
    { "<localleader>?", function() require("which-key").show({ global = false }) end, desc = "buffer local keymaps" },
  },
}

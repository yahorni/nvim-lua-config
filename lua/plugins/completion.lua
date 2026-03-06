return {
  "saghen/blink.cmp",
  version = "v1.*",

  opts = {
    keymap = {
      preset = "none",

      ["<C-T>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = { "hide", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-P>"] = { "select_prev", "fallback" },
      ["<C-N>"] = { "select_next", "fallback" },

      ["<C-U>"] = { "scroll_documentation_up", "fallback" },
      ["<C-D>"] = { "scroll_documentation_down", "fallback" },

      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-S>"] = { "show_signature", "hide_signature", "fallback" },
    },

    cmdline = { enabled = false },
    sources = { default = { "lsp", "path", "buffer" } },
    signature = { enabled = true },
  },
}

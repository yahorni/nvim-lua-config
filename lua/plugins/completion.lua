return {
  "saghen/blink.cmp",
  version = "v1.*",

  opts = {
    keymap = {
      preset = "none",

      ["<C-t>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = { "hide", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
    },

    cmdline = { enabled = false },
    sources = { default = { "lsp", "path", "buffer" } },
    signature = { enabled = true },
  },
}

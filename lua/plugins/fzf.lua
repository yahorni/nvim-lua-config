return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = function()
    local config = require("fzf-lua.config")
    -- quickfix
    config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
    config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
    config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
    config.defaults.keymap.fzf["ctrl-x"] = "jump"
    config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
    config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
    config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
    config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"
  end,
  keys = {
    -- editor
    { "<leader>n",        "<cmd>FzfLua files<cr>",                 desc = "Search [F]iles" },
    { "<leader>f",        "<cmd>FzfLua files resume=true<cr>",     desc = "Search [F]iles resume" },
    { "<leader>N",        "<cmd>FzfLua files cwd=%:h<cr>",         desc = "Search [F]iles in same dir as current" },
    { "<leader>/",        "<cmd>FzfLua blines<cr>",                desc = "Search buffer lines" },
    { "<leader>sq",       "<cmd>FzfLua quickfix<cr>",              desc = "[S]earch [Q]uickfix List" },
    { "<leader>sb",       "<cmd>FzfLua buffers<cr>",               desc = "[S]earch [B]uffers" },
    { "<leader>st",       "<cmd>FzfLua tabs<cr>",                  desc = "[S]earch [T]abs" },
    { "<leader>sT",       "<cmd>FzfLua treesitter<cr>",            desc = "[S]earch [T]reesitter symbols" },
    { "<leader>sc",       "<cmd>FzfLua colorschemes<cr>",          desc = "Colorschemes" },
    { "<leader>sk",       "<cmd>FzfLua keymaps<cr>",               desc = "Keymaps" },
    { "<leader>dd",       "<cmd>FzfLua diagnostics_document<cr>",  desc = "[D]ocument [D]iagnostics" },
    -- grep
    { "<leader><leader>", "<cmd>FzfLua live_grep<cr>",             desc = "Search w/ grep" },
    { "<leader>sr",       "<cmd>FzfLua live_grep resume=true<cr>", desc = "[S]earch w/ grep [R]esume" },
    { "<leader>ss",       "<cmd>FzfLua live_grep cwd=%:h<cr>",     desc = "[S]earch w/ grep in current file dir" },
    { "<leader>sg",       "<cmd>FzfLua grep<cr>",                  desc = "[S]earch w/ [G]rep" },
    { "<leader>sp",       "<cmd>FzfLua grep_project<cr>",          desc = "[S]earch w/ grep in [P]roject" },
    { "<leader>s",        "<cmd>FzfLua grep_visual<cr>",           desc = "[S]earch w/ grep visual selection",     mode = "v" },
    -- git
    { "<localleader>gf",  "<cmd>FzfLua git_files<cr>",             desc = "[G]it [F]iles" },
    { "<localleader>gs",  "<cmd>FzfLua git_status<cr>",            desc = "[G]it [S]tatus" },
    { "<localleader>gd",  "<cmd>FzfLua git_diff<cr>",              desc = "[G]it [D]iff" },
    { "<localleader>gh",  "<cmd>FzfLua git_hunks<cr>",             desc = "[G]it [H]unks" },
    { "<localleader>gc",  "<cmd>FzfLua git_commits<cr>",           desc = "[G]it [C]ommits" },
    { "<localleader>gC",  "<cmd>FzfLua git_bcommits<cr>",          desc = "[G]it Buffer [C]ommits" },
    { "<localleader>gb",  "<cmd>FzfLua git_blame<cr>",             desc = "[G]it [B]lame" },
    { "<localleader>gB",  "<cmd>FzfLua git_branches<cr>",          desc = "[G]it [B]ranches" },
    { "<localleader>gt",  "<cmd>FzfLua git_tags<cr>",              desc = "[G]it [T]ags" },
    { "<localleader>gS",  "<cmd>FzfLua git_stash<cr>",             desc = "[G]it [S]tash" },
    -- lsp
    { "grr",              "<cmd>FzfLua lsp_references<cr>",        desc = "[G]oto [R]eferences" },      -- vim.lsp.buf.references
    { "gd",               "<cmd>FzfLua lsp_definitions<cr>",       desc = "[G]oto [D]efinitions" },     -- vim.lsp.buf.definition
    { "gD",               "<cmd>FzfLua lsp_declarations<cr>",      desc = "[G]oto [D]eclarations" },    -- vim.lsp.buf.declaration
    { "gri",              "<cmd>FzfLua lsp_implementations<cr>",   desc = "[G]oto [I]mplementations" }, -- vim.lsp.buf.implementation
    { "grt",              "<cmd>FzfLua lsp_typedefs<cr>",          desc = "[G]oto T[y]pe Definition" }, -- vim.lsp.buf.type_definition
    { "gO",               "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "[D]ocument [S]ymbols" },     -- vim.lsp.document_symbol
    { "gra",              "<cmd>FzfLua lsp_code_actions<cr>",      desc = "[C]ode [A]ction" },          -- vim.lsp.buf.code_action,
    { "grf",              "<cmd>FzfLua lsp_finder<cr>",            desc = "[C]ombined view of all LSP [L]ocations" },
  },
}

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = { keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } } },
  keys = {
    -- grep
    { "<leader><leader>", "<cmd>FzfLua live_grep<cr>",                desc = "search w/ grep" },
    { "<leader><leader>", "<cmd>FzfLua grep_visual<cr>",              desc = "search w/ grep visual selection",     mode = "v" },
    { "<leader>sr",       "<cmd>FzfLua live_grep resume=true<cr>",    desc = "[s]earch w/ grep [r]esume" },
    { "<leader>sc",       "<cmd>FzfLua live_grep cwd=%:h<cr>",        desc = "[s]earch w/ grep in current file dir" },
    { "<leader>sg",       "<cmd>FzfLua grep<cr>",                     desc = "[s]earch w/ [g]rep" },
    { "<leader>sp",       "<cmd>FzfLua grep_project<cr>",             desc = "[s]earch w/ grep in [p]roject" },
    -- files
    { "<leader>fs",       "<cmd>FzfLua files<cr>",                    desc = "[f]ile [s]earch" },
    { "<leader>fr",       "<cmd>FzfLua files resume=true<cr>",        desc = "[f]ile search [r]esume" },
    { "<leader>fc",       "<cmd>FzfLua files cwd=%:h<cr>",            desc = "[f]ile search [c]urrent dir" },
    -- editor
    { "<leader>sl",       "<cmd>FzfLua blines<cr>",                   desc = "[s]earch buffer [l]ines" },
    { "<leader>sq",       "<cmd>FzfLua quickfix<cr>",                 desc = "[s]earch [q]uickfix List" },
    { "<leader>sb",       "<cmd>FzfLua buffers<cr>",                  desc = "[s]earch [b]uffers" },
    { "<leader>st",       "<cmd>FzfLua tabs<cr>",                     desc = "[s]earch [t]abs" },
    { "<leader>sT",       "<cmd>FzfLua treesitter<cr>",               desc = "[s]earch [T]reesitter symbols" },
    { "<leader>sc",       "<cmd>FzfLua colorschemes<cr>",             desc = "[s]earch [c]olorschemes" },
    { "<leader>sk",       "<cmd>FzfLua keymaps<cr>",                  desc = "[s]earch [k]eymaps" },
    -- git
    { "<leader>gf",       "<cmd>FzfLua git_files<cr>",                desc = "[g]it [f]iles" },
    { "<leader>gs",       "<cmd>FzfLua git_status<cr>",               desc = "[g]it [s]tatus" },
    { "<leader>gd",       "<cmd>FzfLua git_diff<cr>",                 desc = "[g]it [d]iff" },
    { "<leader>gh",       "<cmd>FzfLua git_hunks<cr>",                desc = "[g]it [h]unks" },
    { "<leader>gc",       "<cmd>FzfLua git_commits<cr>",              desc = "[g]it [c]ommits" },
    { "<leader>gC",       "<cmd>FzfLua git_bcommits<cr>",             desc = "[g]it buffer [C]ommits" },
    { "<leader>gb",       "<cmd>FzfLua git_blame<cr>",                desc = "[g]it [b]lame" },
    { "<leader>gB",       "<cmd>FzfLua git_branches<cr>",             desc = "[g]it [B]ranches" },
    { "<leader>gt",       "<cmd>FzfLua git_tags<cr>",                 desc = "[g]it [t]ags" },
    { "<leader>gS",       "<cmd>FzfLua git_stash<cr>",                desc = "[g]it [S]tash" },
    -- lsp
    { "grr",              "<cmd>FzfLua lsp_references<cr>",           desc = "LSP [g]oto [r]efe[r]ences" },    -- vim.lsp.buf.references
    { "gd",               "<cmd>FzfLua lsp_definitions<cr>",          desc = "LSP [g]oto [d]efinitions" },     -- vim.lsp.buf.definition
    { "gD",               "<cmd>FzfLua lsp_declarations<cr>",         desc = "LSP [g]oto [D]eclarations" },    -- vim.lsp.buf.declaration
    { "gri",              "<cmd>FzfLua lsp_implementations<cr>",      desc = "LSP [g]oto [i]mplementations" }, -- vim.lsp.buf.implementation
    { "grt",              "<cmd>FzfLua lsp_typedefs<cr>",             desc = "LSP [g]oto [t]ype Definition" }, -- vim.lsp.buf.type_definition
    { "gO",               "<cmd>FzfLua lsp_document_symbols<cr>",     desc = "LSP document symbols" },         -- vim.lsp.document_symbol
    { "gra",              "<cmd>FzfLua lsp_code_actions<cr>",         desc = "LSP code [a]ction" },            -- vim.lsp.buf.code_action,
    { "grl",              "<cmd>FzfLua lsp_finder<cr>",               desc = "LSP combined view of all [l]ocations" },
    { "grd",              "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "LSP [d]ocument diagnostics" },
  },
}

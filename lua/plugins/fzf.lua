return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = { keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } } },
  keys = {
    -- files
    { "<leader>fs", "<Cmd>FzfLua files<CR>",                    desc = "[f]ile [s]earch" },
    { "<leader>fr", "<Cmd>FzfLua files resume=true<CR>",        desc = "[f]ile search [r]esume" },
    { "<leader>fc", "<Cmd>FzfLua files cwd=%:h<CR>",            desc = "[f]ile search [c]urrent directory" },
    -- grep
    { "<leader>ss", "<Cmd>FzfLua live_grep<CR>",                desc = "[s]earch" },
    { "<leader>sr", "<Cmd>FzfLua live_grep resume=true<CR>",    desc = "[s]earch [r]esume" },
    { "<leader>sc", "<Cmd>FzfLua live_grep cwd=%:h<CR>",        desc = "[s]earch in [c]urrent directory" },
    { "<leader>sB", "<Cmd>FzfLua lgrep_curbuf<CR>",             desc = "[s]earch in current [B]uffer" },
    { "<leader>sg", "<Cmd>FzfLua grep<CR>",                     desc = "[s]earch with [g]rep" },
    { "<leader>sp", "<Cmd>FzfLua grep_project<CR>",             desc = "[s]earch with grep in [p]roject" },
    { "<leader>ss", "<Cmd>FzfLua grep_visual<CR>",              desc = "visual [s]earch",                     mode = "x" },
    { "<leader>sc", "<Cmd>FzfLua grep_visual cwd=%:h<CR>",      desc = "visual [s]earch in [c]urrent dir",    mode = "x" },
    -- editor
    { "<leader>sl", "<Cmd>FzfLua blines<CR>",                   desc = "[s]earch buffer [l]ines" },
    { "<leader>sq", "<Cmd>FzfLua quickfix<CR>",                 desc = "[s]earch [q]uickfix List" },
    { "<leader>sb", "<Cmd>FzfLua buffers<CR>",                  desc = "[s]earch [b]uffers" },
    { "<leader>st", "<Cmd>FzfLua tabs<CR>",                     desc = "[s]earch [t]abs" },
    { "<leader>sT", "<Cmd>FzfLua treesitter<CR>",               desc = "[s]earch [T]reesitter symbols" },
    { "<leader>sC", "<Cmd>FzfLua colorschemes<CR>",             desc = "[s]earch [c]olorschemes" },
    { "<leader>sk", "<Cmd>FzfLua keymaps<CR>",                  desc = "[s]earch [k]eymaps" },
    -- git
    { "<leader>gf", "<Cmd>FzfLua git_files<CR>",                desc = "[g]it [f]iles" },
    { "<leader>gs", "<Cmd>FzfLua git_status<CR>",               desc = "[g]it [s]tatus" },
    { "<leader>gd", "<Cmd>FzfLua git_diff<CR>",                 desc = "[g]it [d]iff" },
    { "<leader>gh", "<Cmd>FzfLua git_hunks<CR>",                desc = "[g]it [h]unks" },
    { "<leader>gc", "<Cmd>FzfLua git_commits<CR>",              desc = "[g]it [c]ommits" },
    { "<leader>gC", "<Cmd>FzfLua git_bcommits<CR>",             desc = "[g]it buffer [C]ommits" },
    { "<leader>gb", "<Cmd>FzfLua git_blame<CR>",                desc = "[g]it [b]lame" },
    { "<leader>gB", "<Cmd>FzfLua git_branches<CR>",             desc = "[g]it [B]ranches" },
    { "<leader>gt", "<Cmd>FzfLua git_tags<CR>",                 desc = "[g]it [t]ags" },
    { "<leader>gS", "<Cmd>FzfLua git_stash<CR>",                desc = "[g]it [S]tash" },
    -- lsp
    { "grr",        "<Cmd>FzfLua lsp_references<CR>",           desc = "LSP [g]oto [r]efe[r]ences" },    -- vim.lsp.buf.references
    { "gd",         "<Cmd>FzfLua lsp_definitions<CR>",          desc = "LSP [g]oto [d]efinitions" },     -- vim.lsp.buf.definition
    { "gD",         "<Cmd>FzfLua lsp_declarations<CR>",         desc = "LSP [g]oto [D]eclarations" },    -- vim.lsp.buf.declaration
    { "gri",        "<Cmd>FzfLua lsp_implementations<CR>",      desc = "LSP [g]oto [i]mplementations" }, -- vim.lsp.buf.implementation
    { "grt",        "<Cmd>FzfLua lsp_typedefs<CR>",             desc = "LSP [g]oto [t]ype Definition" }, -- vim.lsp.buf.type_definition
    { "gO",         "<Cmd>FzfLua lsp_document_symbols<CR>",     desc = "LSP document symbols" },         -- vim.lsp.document_symbol
    { "gra",        "<Cmd>FzfLua lsp_code_actions<CR>",         desc = "LSP code [a]ction" },            -- vim.lsp.buf.code_action,
    { "grl",        "<Cmd>FzfLua lsp_finder<CR>",               desc = "LSP combined view of all [l]ocations" },
    { "grd",        "<Cmd>FzfLua lsp_document_diagnostics<CR>", desc = "LSP [d]ocument diagnostics" },
  },
}

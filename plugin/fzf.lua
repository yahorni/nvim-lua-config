require("fzf-lua").setup({ keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } } })

-- files
vim.keymap.set("n", "<leader>fs", "<Cmd>FzfLua files<CR>", { desc = "[f]ile [s]earch" })
vim.keymap.set("n", "<leader>fr", "<Cmd>FzfLua files resume=true<CR>", { desc = "[f]ile search [r]esume" })
vim.keymap.set("n", "<leader>fc", "<Cmd>FzfLua files cwd=%:h<CR>", { desc = "[f]ile search [c]urrent directory" })

-- grep
vim.keymap.set("n", "<leader>ss", "<Cmd>FzfLua live_grep<CR>", { desc = "[s]earch" })
vim.keymap.set("n", "<leader>sr", "<Cmd>FzfLua live_grep resume=true<CR>", { desc = "[s]earch [r]esume" })
vim.keymap.set("n", "<leader>sc", "<Cmd>FzfLua live_grep cwd=%:h<CR>", { desc = "[s]earch in [c]urrent directory" })
vim.keymap.set("n", "<leader>sB", "<Cmd>FzfLua lgrep_curbuf<CR>", { desc = "[s]earch in current [B]uffer" })
vim.keymap.set("n", "<leader>sg", "<Cmd>FzfLua grep<CR>", { desc = "[s]earch with [g]rep" })
vim.keymap.set("n", "<leader>sp", "<Cmd>FzfLua grep_project<CR>", { desc = "[s]earch with grep in [p]roject" })
vim.keymap.set("x", "<leader>ss", "<Cmd>FzfLua grep_visual<CR>", { desc = "visual [s]earch" })
vim.keymap.set("x", "<leader>sc", "<Cmd>FzfLua grep_visual cwd=%:h<CR>", { desc = "visual [s]earch in [c]urrent dir" })

-- editor
vim.keymap.set("n", "<leader>sl", "<Cmd>FzfLua blines<CR>", { desc = "[s]earch buffer [l]ines" })
vim.keymap.set("n", "<leader>sq", "<Cmd>FzfLua quickfix<CR>", { desc = "[s]earch [q]uickfix List" })
vim.keymap.set("n", "<leader>sb", "<Cmd>FzfLua buffers<CR>", { desc = "[s]earch [b]uffers" })
vim.keymap.set("n", "<leader>st", "<Cmd>FzfLua tabs<CR>", { desc = "[s]earch [t]abs" })
vim.keymap.set("n", "<leader>sT", "<Cmd>FzfLua treesitter<CR>", { desc = "[s]earch [T]reesitter symbols" })
vim.keymap.set("n", "<leader>sC", "<Cmd>FzfLua colorschemes<CR>", { desc = "[s]earch [c]olorschemes" })
vim.keymap.set("n", "<leader>sk", "<Cmd>FzfLua keymaps<CR>", { desc = "[s]earch [k]eymaps" })

-- git
vim.keymap.set("n", "<leader>gf", "<Cmd>FzfLua git_files<CR>", { desc = "[g]it [f]iles" })
vim.keymap.set("n", "<leader>gs", "<Cmd>FzfLua git_status<CR>", { desc = "[g]it [s]tatus" })
vim.keymap.set("n", "<leader>gd", "<Cmd>FzfLua git_diff<CR>", { desc = "[g]it [d]iff" })
vim.keymap.set("n", "<leader>gh", "<Cmd>FzfLua git_hunks<CR>", { desc = "[g]it [h]unks" })
vim.keymap.set("n", "<leader>gc", "<Cmd>FzfLua git_commits<CR>", { desc = "[g]it [c]ommits" })
vim.keymap.set("n", "<leader>gC", "<Cmd>FzfLua git_bcommits<CR>", { desc = "[g]it buffer [C]ommits" })
vim.keymap.set("n", "<leader>gb", "<Cmd>FzfLua git_blame<CR>", { desc = "[g]it [b]lame" })
vim.keymap.set("n", "<leader>gB", "<Cmd>FzfLua git_branches<CR>", { desc = "[g]it [B]ranches" })
vim.keymap.set("n", "<leader>gt", "<Cmd>FzfLua git_tags<CR>", { desc = "[g]it [t]ags" })
vim.keymap.set("n", "<leader>gS", "<Cmd>FzfLua git_stash<CR>", { desc = "[g]it [S]tash" })

-- lsp
vim.keymap.set("n", "grr", "<Cmd>FzfLua lsp_references<CR>", { desc = "LSP [g]oto [r]efe[r]ences" })         -- vim.lsp.buf.references
vim.keymap.set("n", "gd", "<Cmd>FzfLua lsp_definitions<CR>", { desc = "LSP [g]oto [d]efinitions" })          -- vim.lsp.buf.definition
vim.keymap.set("n", "gD", "<Cmd>FzfLua lsp_declarations<CR>", { desc = "LSP [g]oto [D]eclarations" })        -- vim.lsp.buf.declaration
vim.keymap.set("n", "gri", "<Cmd>FzfLua lsp_implementations<CR>", { desc = "LSP [g]oto [i]mplementations" }) -- vim.lsp.buf.implementation
vim.keymap.set("n", "grt", "<Cmd>FzfLua lsp_typedefs<CR>", { desc = "LSP [g]oto [t]ype Definition" })        -- vim.lsp.buf.type_definition
vim.keymap.set("n", "gO", "<Cmd>FzfLua lsp_document_symbols<CR>", { desc = "LSP document symbols" })         -- vim.lsp.document_symbol
vim.keymap.set("n", "gra", "<Cmd>FzfLua lsp_code_actions<CR>", { desc = "LSP code [a]ction" })               -- vim.lsp.buf.code_action,
vim.keymap.set("n", "grl", "<Cmd>FzfLua lsp_finder<CR>", { desc = "LSP combined view of all [l]ocations" })
vim.keymap.set("n", "grd", "<Cmd>FzfLua lsp_document_diagnostics<CR>", { desc = "LSP [d]ocument diagnostics" })

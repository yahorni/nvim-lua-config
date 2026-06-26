-- vim: fdm=marker fdl=0

-- {{{ [[ Options ]]
-- leader/localleader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- status line
vim.opt.laststatus = 2
-- encoding/fileformat
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,cp1251,koi8-r,ucs-2,cp866"
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.endofline = true
-- search
vim.opt.incsearch = true
vim.opt.hlsearch = true -- can cause slowdown in huge files
-- preview substitutions live, as you type
vim.opt.inccommand = "split"
-- case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- tab/space
vim.opt.tabstop = 4      -- width for Tab
vim.opt.shiftwidth = 4   -- width for shifting with '>>'/'<<'
vim.opt.softtabstop = -1 -- width for Tab/Backspace align for insert/delete
vim.opt.smarttab = true
vim.opt.expandtab = true
-- indentation
vim.opt.autoindent = true
vim.opt.breakindent = true
-- nonprintable characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "> ",
  trail = "·",
  nbsp = "␣", -- type: <C-K><space><space>
  extends = ">",
  precedes = "<",
  leadmultispace = "│   ",
}
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true -- can cause slowdown
-- info/swap/backup
vim.opt.shadafile = "NONE"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false
-- modeline
vim.opt.modeline = true
vim.opt.modelines = 5
-- messages in command line
vim.opt.showmode = true
vim.opt.showcmd = true -- can cause slowdown
-- wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,full"
-- mouse
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:5"
-- folding
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true
-- conceal
vim.opt.conceallevel = 0
vim.opt.concealcursor = "nvic"
-- tags
vim.opt.tags = "./tags,tags,~/.local/share/tags"
vim.opt.tagrelative = false -- disable directory prefix for tag file
-- file search (:find, :vim)
vim.opt.path:append("**")
vim.opt.wildignore:append("*/?build/*,*/.git/*,*/node_modules/*")
--  enable system clipboard
vim.opt.clipboard = "unnamedplus"
-- minimal lines before/after cursor
vim.opt.scrolloff = 5
-- do not autoreload changed file
vim.opt.autoread = false
-- highlight current line
vim.opt.cursorline = true -- can cause slowdown
-- do not indent: N-s - namespaces, g0 - public/private/protected
vim.opt.cinoptions = "N-s,g0"
-- enable <> pair
vim.opt.matchpairs:append("<:>")
-- do not save quickfix to session file
vim.opt.sessionoptions:remove("blank,folds,terminal")
-- enable local configuration
vim.opt.exrc = true
-- shorten vim messages
vim.opt.shortmess = "atT"
-- text width
vim.opt.textwidth = 120
vim.opt.colorcolumn = "+0" -- can cause slowdown
-- window title
vim.opt.title = true       -- causes nvim to black screen in raw console
-- make buffer hidden when it's abandoned
vim.opt.hidden = true
-- keep signcolumn on
vim.opt.signcolumn = "yes"
-- configure completion
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"
vim.opt.complete:append("o")
vim.opt.autocomplete = true
vim.opt.pumheight = 10
-- decrease update time
vim.opt.updatetime = 250
-- decrease timeout length
vim.opt.timeoutlen = 700
-- extended color support
vim.opt.termguicolors = true -- makes everything ugly in raw console
-- add/subtract numbers
vim.opt.nrformats = "bin,hex,unsigned"
-- spell (spellfile: ~/.local/share/nvim/site/spell/en.utf-8.add)
vim.opt.spell = true
vim.opt.spelllang = ""
vim.opt.spellcapcheck = ""
--- }}}

-- {{{ [[ Colorscheme ]]
vim.o.background = "light"
vim.cmd("colorscheme retrobox")
-- }}}

-- {{{ [[ Keymaps ]]

-- disable some keys
vim.keymap.set({ "n", "x" }, "<space>", "<nop>", { silent = true })
vim.keymap.set({ "n", "i" }, "<F1>", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
-- change <paste> command behaviour
vim.keymap.set("x", "p", '"_dp', { noremap = true, desc = "[p]aste without yanking" })
vim.keymap.set("x", "P", '"_dP', { noremap = true, desc = "[P]aste without yanking" })
-- disable highlight
vim.keymap.set("n", "<leader>h", "<Cmd>noh<CR>", { noremap = true })
-- copy til EOL
vim.keymap.set("n", "Y", "y$", { noremap = true })
-- copy file name
vim.keymap.set("n", "ygr", "<Cmd>let @+ = expand('%')<CR>", { noremap = true, desc = "[y]ank file [r]elative path" })
vim.keymap.set("n", "ygf", "<Cmd>let @+ = expand('%:p')<CR>", { noremap = true, desc = "[y]ank file [f]ull path" })
vim.keymap.set("n", "ygn", "<Cmd>let @+ = expand('%:t')<CR>", { noremap = true, desc = "[y]ank file [n]ame" })
-- comments
vim.keymap.set("n", "<C-_>", "gccj", { remap = true, desc = "comment line" })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, desc = "comment visual selection" })

-- {{{ abbreviate annoying keys
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev QA qa")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev WA wa")
vim.cmd("cnoreabbrev Wqa wqa")
vim.cmd("cnoreabbrev w\\ w")
vim.cmd("cnoreabbrev e\\ e")
vim.cmd("cnoreabbrev w' w")
vim.cmd("cnoreabbrev e' e")
vim.cmd("cnoreabbrev E! e!")
vim.cmd("cnoreabbrev q1 q!")
vim.cmd("cnoreabbrev qw wq")
vim.cmd("cnoreabbrev Vs vs")
vim.cmd("cnoreabbrev VS vs")
vim.cmd("cnoreabbrev Sp sp")
vim.cmd("cnoreabbrev SP sp")
-- }}}

-- {{{ session
local git_root = vim.fs.root(vim.fn.getcwd(), ".git")
local session_file = git_root and (git_root .. "/.session.vim") or ".session.vim"
vim.keymap.set("n", "<leader>m",
               "<Cmd>mksession! " .. session_file .. ' <bar> echo "Session file: ' .. session_file .. '"<CR>')
vim.keymap.set("n", "<leader>l", "<Cmd>source " .. session_file .. "<CR>")
-- }}}

-- {{{ tabs
vim.keymap.set("n", "<leader>t", function()
                 local current_file = vim.api.nvim_buf_get_name(0)
                 return "<Cmd>tabnew" .. (current_file == "" and "" or " %") .. "<CR>"
               end, { noremap = true, expr = true, desc = "create new [t]ab (same as current or empty)" })
vim.keymap.set("n", "<leader>T", "<Cmd>tabclose<CR>", { noremap = true, desc = "close [T]ab" })
vim.keymap.set("n", "<leader>[", "<Cmd>tabprev<CR>", { noremap = true, desc = "previous tab" })
vim.keymap.set("n", "<leader>]", "<Cmd>tabnext<CR>", { noremap = true, desc = "next tab" })
vim.keymap.set("n", "<leader>{", "<Cmd>tabmove -1<CR>", { noremap = true, desc = "move tab to the left" })
vim.keymap.set("n", "<leader>}", "<Cmd>tabmove +1<CR>", { noremap = true, desc = "move tab to the right" })
-- switch to tab by number
vim.keymap.set("n", "<leader>1", "1gt", { noremap = true })
vim.keymap.set("n", "<leader>2", "2gt", { noremap = true })
vim.keymap.set("n", "<leader>3", "3gt", { noremap = true })
vim.keymap.set("n", "<leader>4", "4gt", { noremap = true })
vim.keymap.set("n", "<leader>5", "5gt", { noremap = true })
vim.keymap.set("n", "<leader>6", "6gt", { noremap = true })
vim.keymap.set("n", "<leader>7", "7gt", { noremap = true })
vim.keymap.set("n", "<leader>8", "8gt", { noremap = true })
vim.keymap.set("n", "<leader>9", "<Cmd>tablast<CR>", { noremap = true })
--- }}}

-- {{{ column alignment
vim.api.nvim_create_user_command(
  "AlignColumn",
  function(opts)
    local delim = opts.fargs[1] or "|"
    vim.cmd(string.format("%d,%d!column -t -s '%s' -o '%s'", opts.line1, opts.line2, delim, delim))
  end,
  { nargs = "?", range = true })
vim.keymap.set("n", "<leader>a", "vip:AlignColumn<CR>", { noremap = true, desc = "select paragraph and [a]lign it" })
vim.keymap.set("x", "<leader>a", "<Cmd>AlignColumn<CR>", { noremap = true, desc = "[a]lign selected text" })
-- }}}

-- {{{ window switch/resize
vim.keymap.set("n", "<leader>r",
               function() vim.g.window_resize = not vim.g.window_resize end,
               { silent = true, desc = "toggle window [r]esizing" })
vim.keymap.set("n", "<C-H>",
               function() if not vim.g.window_resize then return "<C-W><C-H>" else return ":vert res -1<CR>" end end,
               { silent = true, expr = true, noremap = true })
vim.keymap.set("n", "<C-J>",
               function() if not vim.g.window_resize then return "<C-W><C-J>" else return ":res -1<CR>" end end,
               { silent = true, expr = true, noremap = true })
vim.keymap.set("n", "<C-K>",
               function() if not vim.g.window_resize then return "<C-W><C-K>" else return ":res +1<CR>" end end,
               { silent = true, expr = true, noremap = true })
vim.keymap.set("n", "<C-L>",
               function() if not vim.g.window_resize then return "<C-W><C-L>" else return ":vert res +1<CR>" end end,
               { silent = true, expr = true, noremap = true })
-- }}}

-- {{{ diagnostics
vim.diagnostic.config({ virtual_lines = { current_line = true } })
vim.keymap.set("n", "<leader>de", vim.diagnostic.enable, { desc = "[d]iagnostic [e]nable" })
vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.enable(false) end, { desc = "[d]iagnostics [d]isable" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "open [d]iagnostics [f]loating window" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "open [d]iagnostics [l]oclist" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "open [d]iagnostics [q]uickfix" })
-- }}}

-- custom buffer width
vim.keymap.set("n", "<C-W>R",
               function() vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.65)) end,
               { desc = "[R]esize buffer width to 65%" })

-- file build
vim.keymap.set("n", "<leader>cb", function()
                 local makeprg = vim.bo.makeprg
                 vim.bo.makeprg = "compiler.sh build %"
                 vim.cmd.make()
                 vim.bo.makeprg = makeprg
               end, { silent = true, noremap = true, desc = "[c]ode [b]uild" })
vim.keymap.set("n", "<leader>cB", function()
                 local makeprg = vim.bo.makeprg
                 vim.bo.makeprg = "compiler.sh build-alt %"
                 vim.cmd.make()
                 vim.bo.makeprg = makeprg
               end, { silent = true, noremap = true, desc = "[c]ode [B]uild (alt)" })

-- file execution
vim.keymap.set("n", "<leader>cr", ":!compiler.sh run '%'<CR>", { noremap = true, desc = "[c]ode [r]un" })
vim.keymap.set("n", "<leader>cR", ":!compiler.sh run-alt '%'<CR>", { noremap = true, desc = "[c]ode [R]un (alt)" })

-- file permissions
vim.keymap.set("n", "<leader>xa", ":!chmod +x '%'<CR>", { noremap = true, desc = "e[X]ecute permission: [a]dd" })
vim.keymap.set("n", "<leader>xr", ":!chmod -x '%'<CR>", { noremap = true, desc = "e[X]ecute permission: [r]emove" })

-- remove trailing whitespaces
vim.cmd([[ nn <leader>xw :%s/\s\+$//e <bar> nohl<CR> ]])
vim.cmd([[ vn <leader>xw y:'<,'>s/\s\+$//e <bar> nohl<CR> ]])
-- remove empty lines
vim.cmd([[ nn <leader>xe :g/^$/d <bar> nohl<CR> ]])
vim.cmd([[ vn <leader>xe y:'<,'>g/^$/d <bar> nohl<CR> ]])
-- squish consecutive duplicate lines
vim.cmd([[ nn <leader>xl :%s;\v^(.*)(\n\1)+$;\1;<CR> ]])
-- remove swaps
vim.cmd([[ nn <leader>xs :!rm -f ~/.local/state/nvim/swap/*<CR> ]])

-- }}}

-- {{{ [[ Autocmds ]]
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "gitconfig", "make", "just" },
  callback = function() vim.bo.expandtab = false end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "json*" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.opt.listchars:append({ leadmultispace = "| " })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "csv", "typst" },
  callback = function() vim.bo.textwidth = 0 end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function() if vim.bo.filetype == "" then vim.bo.textwidth = 0 end end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "text", "markdown", "gitcommit", "typst" },
  callback = function() vim.bo.spelllang = "en,ru" end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  pattern = "*",
  callback = function() vim.hl.on_yank() end,
})
-- }}}

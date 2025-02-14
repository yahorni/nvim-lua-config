return {
  'ibhagwan/fzf-lua',
  opts = function()
    local config = require 'fzf-lua.config'

    -- Quickfix
    config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
    config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
    config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
    config.defaults.keymap.fzf['ctrl-x'] = 'jump'
    config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
    config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
    config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
    config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'
  end,
  keys = {
    -- editor
    { '<leader>f', '<cmd>FzfLua files cwd=%:p:h<cr>', desc = '[S]earch [F]iles' },
    { '<leader>sf', '<cmd>FzfLua files<cr>', desc = '[S]earch [F]iles' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = '[S]earch [Q]uickfix List' },
    { '<leader>st', '<cmd>FzfLua treesitter<cr>', desc = '[S]earch [T]reesitter Symbols' },
    { '<leader><leader>', '<cmd>FzfLua blines<cr>', desc = '[S]earch [B]uffer Lines' },
    { '<leader>/', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
    { '<leader>?', '<cmd>FzfLua tabs<cr>', desc = 'Tabs' },
    { '<leader>sc', '<cmd>FzfLua colorschemes<cr>', desc = 'Colorschemes' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Keymaps' },
    -- grep
    { '<leader>sg', '<cmd>FzfLua grep<cr>', desc = '[S]earch w/ [G]rep' },
    { '<leader>sL', '<cmd>FzfLua grep_last<cr>', desc = '[S]earch w/ Grep [L]ast pattern' },
    { '<leader>sl', '<cmd>FzfLua live_grep<cr>', desc = '[S]earch w/ [G]rep' },
    { '<leader>sr', '<cmd>FzfLua live_grep_resume<cr>', desc = '[S]earch w/ Grep [R]esume' },
    { '<leader>sv', '<cmd>FzfLua grep_visual<cr>', mode = 'v', desc = '[S]earch w/ Grep [V]isual Selection' },
    { '<leader>sp', '<cmd>FzfLua grep_project<cr>', desc = '[S]earch w/ Grep in Project' },
    -- git
    { '<leader>gff', '<cmd>FzfLua git_files<cr>', desc = 'Git Files' },
    { '<leader>gfs', '<cmd>FzfLua git_status <cr>', desc = 'Git Status' },
    { '<leader>gfc', '<cmd>FzfLua git_commits<cr>', desc = 'Git Commits' },
    { '<leader>gfB', '<cmd>FzfLua git_bcommits<cr>', desc = 'Git Buffer Commits' },
    { '<leader>gfl', '<cmd>FzfLua git_blame<cr>', desc = 'Git Blame' },
    { '<leader>gfb', '<cmd>FzfLua git_branches<cr>', desc = 'Git Branches' },
    { '<leader>gft', '<cmd>FzfLua git_tags<cr>', desc = 'Git Tags' },
    { '<leader>gfS', '<cmd>FzfLua git_stash<cr>', desc = 'Git Stash' },
  },
}

return {
  { -- File tree setup with Fern
    "lambdalisue/fern.vim",
    init = function()
      vim.g["fern#default_hidden"] = 1
      vim.g["fern#disable_default_mappings"] = 1
      vim.g["fern#disable_viewer_hide_cursor"] = 1

      local fern_init = function()
        vim.keymap.set("n", "<cr>", "<Plug>(fern-action-open-or-expand)", { buffer = true, nowait = true })
        vim.keymap.set("n", "l", "<Plug>(fern-action-open-or-expand)", { buffer = true, nowait = true })
        vim.keymap.set("n", "h", "<Plug>(fern-action-collapse)", { buffer = true, nowait = true })
        vim.keymap.set("n", "s", "<Plug>(fern-action-open:split)", { buffer = true, nowait = true })
        vim.keymap.set("n", "v", "<Plug>(fern-action-open:vsplit)", { buffer = true, nowait = true })
        vim.keymap.set("n", "r", "<Plug>(fern-action-reload:cursor)", { buffer = true, nowait = true })
        vim.keymap.set("n", "R", "<Plug>(fern-action-reload:all)", { buffer = true, nowait = true })
        vim.keymap.set("n", "u", "<Plug>(fern-action-leave)", { buffer = true, nowait = true })
        vim.keymap.set("n", "d", "<Plug>(fern-action-enter)", { buffer = true, nowait = true })
        vim.keymap.set("n", "c", "<Plug>(fern-action-cancel)", { buffer = true, nowait = true })
        vim.keymap.set("n", "D", "<Plug>(fern-action-remove)", { buffer = true, nowait = true })
        vim.keymap.set("n", "za", "<Plug>(fern-action-hidden:toggle)", { buffer = true })
        vim.keymap.set("n", "yy", "<Plug>(fern-action-yank:label)", { buffer = true })
        vim.keymap.set("n", "yb", "<Plug>(fern-action-yank)", { buffer = true })
        vim.keymap.set("n", "m", "<Plug>(fern-action-rename)", { buffer = true, nowait = true })
      end

      local fern_group = vim.api.nvim_create_augroup("FernGroup", { clear = true })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "fern",
        group = fern_group,
        callback = fern_init,
      })
    end,
    keys = {
      { "<C-n>", "<cmd>Fern . -reveal=%<cr>", "Open file tree in buffer" },
      { "<leader>n", "<cmd>Fern %:p:h -reveal=%:p<cr>", "Open file tree in buffer for current dir" },
      { "<leader>N", "<cmd>Fern . -reveal=% -drawer -toggle<cr>", "Open file tree in drawer" },
    },
  },

  -- Replace netrw with fern by default
  -- TODO: make it work
  {
    "lambdalisue/fern-hijack.vim",
    dependencies = { "lambdalisue/fern.vim" },
  },

  -- Show git status in file tree
  {
    "lambdalisue/fern-git-status.vim",
    dependencies = { "lambdalisue/fern.vim" },
    init = function()
      vim.g["fern_git_status#disable_ignored"] = 1
      vim.g["fern_git_status#disable_submodules"] = 1
    end,
  },
}

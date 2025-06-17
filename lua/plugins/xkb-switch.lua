return { -- switch language keymap in insert mode
  "lyokha/vim-xkbswitch",
  init = function()
    vim.g.XkbSwitchEnabled = 1
    vim.g.XkbSwitchLib = "/usr/lib/libxkbswitch.so"
  end,
}

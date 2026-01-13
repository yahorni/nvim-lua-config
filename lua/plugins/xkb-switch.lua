return {
  "lyokha/vim-xkbswitch", -- switch language keymap in insert mode
  init = function()
    vim.g.XkbSwitchEnabled = 1
    vim.g.XkbSwitchLib = "/usr/lib/libxkbswitch.so"
  end,
}

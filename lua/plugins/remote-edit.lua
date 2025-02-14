return {
  'zenbro/mirror.vim',
  init = function()
    vim.g['mirror#config_path'] = '~/.config/nvim-mirrors.yaml'
  end
}

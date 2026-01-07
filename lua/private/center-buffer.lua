return function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local has_tabs = #vim.api.nvim_list_tabpages() > 1 and 1 or 0

  local top_wins = {}
  for _, win in ipairs(wins) do
    local pos = vim.api.nvim_win_get_position(win)
    if pos[1] == has_tabs then
      table.insert(top_wins, win)
    end
  end

  if #top_wins < 2 then
    vim.cmd("vsplit")
    table.insert(top_wins, vim.api.nvim_get_current_win())
  else
    table.sort(top_wins, function(a, b)
      local a_pos = vim.api.nvim_win_get_position(a)
      local b_pos = vim.api.nvim_win_get_position(b)
      return a_pos[2] < b_pos[2]
    end)
  end

  local first_win = top_wins[1]
  local second_win = top_wins[2]

  local current_win = vim.api.nvim_get_current_win()

  if current_win ~= second_win then
    local current_buf = vim.api.nvim_win_get_buf(current_win)
    local second_buf = vim.api.nvim_win_get_buf(second_win)
    vim.api.nvim_win_set_buf(first_win, second_buf)
    vim.api.nvim_win_set_buf(second_win, current_buf)

    vim.api.nvim_set_current_win(second_win)
  end

  local total_width = vim.o.columns
  local target_width = math.floor(total_width * 0.33 + 0.5)
  vim.api.nvim_win_set_width(first_win, target_width)
end

local curl = require('cheat.curl')

local M = {}

local function center_header(str)
  local width = vim.api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  return string.rep(' ', shift) .. str
end

M.size_opts = function()
  local w_width = math.floor(vim.o.columns * 0.7)
  local w_height = math.floor(vim.o.lines * 0.7)

  local w_left = math.floor((vim.o.columns - w_width) / 2)
  local w_top = math.floor(((vim.o.lines - w_height) / 2) - 1)

  return {
    w_width,
    w_height,
    w_left,
    w_top
  }
end

local function window_opts()
  return {
    relative = "editor",
    row = M.size_opts()[4],
    col = M.size_opts()[3],
    width = M.size_opts()[1],
    height = M.size_opts()[2],
    style = "minimal",
  }
end

local function border_opts()
  return  {
    relative = "editor",
    row = M.size_opts()[4] - 1,
    col = M.size_opts()[3] - 1,
    width = M.size_opts()[1] + 2,
    height = M.size_opts()[2] + 2,
    style = "minimal",
  }
end

local function create_border()
  local b_buf = vim.api.nvim_create_buf(false, true)

  local border_lines = { '╭' .. string.rep('─', M.size_opts()[1]) .. '╮' }
  local middle_line = '│' .. string.rep(' ', M.size_opts()[1]) .. '│'
  for i=1, M.size_opts()[2] do
    table.insert(border_lines, middle_line)
  end
  table.insert(border_lines, '╰' .. string.rep('─', M.size_opts()[1]) .. '╯')
  vim.api.nvim_buf_set_lines(b_buf, 0, -1, false, border_lines)

  local b_win = vim.api.nvim_open_win(b_buf, true, border_opts())
  vim.api.nvim_buf_set_keymap(0, "n", "q", ":bd<CR>", { noremap = true })
  vim.api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..b_buf)

end

M.create_window = function()
  local query_result = curl.query(curl.get_lang(), curl.get_query())

  local w_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_keymap(w_buf, "n", "q", ":bd<CR>", { noremap = true })

  for line in query_result:gmatch("([^\r\n]*)[\r\n]?") do
    vim.api.nvim_buf_set_lines(w_buf, 0, 0, false, { line })
  end

  create_border()
  local w_win = vim.api.nvim_open_win(w_buf, true, window_opts())
  -- vim.api.nvim_buf_set_lines(w_buf, 0, -1, false, { center_header('Cheat.nvim'), '', ''})
  -- vim.cmd([[
  --   hi def link CheatHeader       Identifier
  -- ]])
  -- vim.api.nvim_buf_add_highlight(w_buf, -1, 'CheatHeader', 0, 0, -1)
end

return M

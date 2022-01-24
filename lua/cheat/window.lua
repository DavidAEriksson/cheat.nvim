local curl = require('cheat.curl')
local popup = require('plenary.popup')

local M = {}

M.window_opts = function ()
  local w_width = math.floor(vim.o.columns * 0.7)
  local w_height = math.floor(vim.o.lines * 0.7)

  local w_left = math.floor((vim.o.columns - w_width) / 2)
  local w_top = math.floor(((vim.o.lines - w_height) / 2) - 1)

  local opts = {
    relative = "editor",
    row = w_top,
    col = w_left,
    width = w_width,
    height = w_height,
    style = "minimal",
  }

  return opts
end

M.create_window = function()
  local query_result = curl.query(curl.get_lang(), curl.get_query())

  print("?", query_result)
  -- local w_opts = M.window_opts()
  -- local w_buf = vim.api.nvim_create_buf(false, true)
  -- vim.api.nvim_buf_set_keymap(w_buf, "n", "q", ":bd<CR>", { noremap = true })
  -- vim.api.nvim_buf_set_lines(w_buf, 0, -1, false, t)
  -- local w_win = vim.api.nvim_open_win(w_buf, true, w_opts)

end

return M

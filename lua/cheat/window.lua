local curl = require('cheat.curl')
local popup = require('plenary.popup')

local M = {}

Cheat_win_id = nil
Cheat_buf = nil

local function center(str)
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


M.create_window = function()
  local q_lang = curl.get_lang()
  local q_query = curl.get_query()
  local query_result = curl.query(q_lang, q_query)

  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
  local bufnr = vim.api.nvim_create_buf(false, false)

  local Cheat_win_id, win = popup.create(bufnr, {
    title = "Cheat.nvim",
    highlight = "CheatWindow",
    line = window_opts().row,
    col = window_opts().col,
    minwidth = window_opts().width,
    minheight = window_opts().height,
    borderchars = borderchars,
  })

  vim.api.nvim_buf_set_lines(bufnr, 0,0, false, { center([[Question:]] .. q_query) })
  vim.cmd([[
    hi def link QuestionSubHeader CursorColumn
  ]])

  vim.api.nvim_buf_add_highlight(bufnr, -1, 'QuestionSubHeader', 0, 0, -1)

  for line in query_result:gmatch("([^\r\n]*)[\r\n]?") do
    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { line })
  end

  vim.api.nvim_win_set_option(
      win.border.win_id,
      "winhl",
      "Normal:CheatBorder"
  )

  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":bd!<CR>", { noremap=true, silent=true })
  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
end

return M

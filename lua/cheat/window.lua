local M = {}

local popup = require 'plenary.popup'

M.create_window = function()
  

  local win = vim.api.nvim_open_win(0, false,{ col=3, width=12, height=3})
  print(win)
  -- local win_id = popup.create({ "Opt1" ,"Opt2" }, {
  --   line = 15,
  --   col = 45,
  --   minwidth = 20,
  --   border = true,
  --   callback = function(win_id, sel)
  --     print(sel)
  --   end,
  -- })
  -- print(win_id)
end

return M

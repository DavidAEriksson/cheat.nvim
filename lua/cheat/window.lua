local M = {}

local popup = require 'plenary.popup'

M.create_window = function()
  local win_id = popup.create({ "" }, {})
  print(win_id)
end

return M

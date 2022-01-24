local curl = require('cheat.curl')

local M = {}

M.create_window = function()
  curl.query(curl.get_lang(), curl.get_query())
end

return M

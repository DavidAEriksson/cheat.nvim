local curl = require('cheat.curl')

local M = {}

M.create_window = function()
  local query_result = curl.query(curl.get_lang(), curl.get_query())
end

return M

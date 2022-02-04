local M = {}

local win = require 'cheat.window'
local curl = require 'cheat.curl'

M.query= function()
  print("[Cheat.sh Question]")
  local lang = curl.get_lang()
  local query = curl.get_query()
  local query_result = curl.query(lang, query)
  local header = ([[Question]] .. "(" .. lang .. "):" .. query)
  win.create_window(query_result, header)
end

-- TODO: Enable this when it works
-- M.learn = function()
--   print("Learn a Language")
--   local lang = curl.get_lang()
--   local query_result = curl.learn(lang)
--   local header = ([[Learn: ]] .. "[" .. lang .. "]")
--
--   win.create_window(query_result, header)
-- end

return M

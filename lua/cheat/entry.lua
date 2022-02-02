local M = {}

local win = require 'cheat.window'
local curl = require 'cheat.curl'

-- TODO: Redo this, should take function as parameter and load into window
-- depending on what method was called.
-- Or maybe have different M.method <- probably this one
M.query= function()
  print("Create a query")
  local lang = curl.get_lang()
  local query = curl.get_query()
  local query_result = curl.query(lang, query)
  local header = ([[Question]] .. "(" .. lang .. "):" .. query)
  win.create_window(query_result, header)
end

M.learn = function()
  print("Learn a Language")
  local lang = curl.get_lang()
  local query_result = curl.learn(lang)
  local header = ([[Learn: ]] .. "[" .. lang .. "]")

  win.create_window(query_result, header)

  -- Kinda like this:
  -- local lang = curl.get_lang()
  -- win.create_window(lang)
  --
  -- This way we can call :lua require('cheat.entry').learn()<CR>
  -- from whatever scope
end


return M

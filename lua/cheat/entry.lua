local M = {}

local win = require 'cheat.window'
local curl = require 'cheat.curl'
local lang_table = require 'cheat.languages'.languages

-- @function: `query`
-- Standard query for selected language
-- If language is not selected, file extension will be used to map
-- to correct language in cheat.languages on M.languages
M.query= function()
  print("[Cheat.sh Question]")

  local lang = curl.get_lang()
  Lt_fil = lang_table[lang]

  local query = curl.get_query()
  local query_result = curl.query(Lt_fil, query)
  local header = ([[Question]] .. "(" .. Lt_fil .. "):" .. query)
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

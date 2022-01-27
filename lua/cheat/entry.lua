local M = {}

local win = require 'cheat.window'
local curl = require 'cheat.curl'

-- TODO: Redo this, should take function as parameter and load into window
-- depending on what method was called.
-- Or maybe have different M.method <- probably this one
M.entry = function()
  win.create_window()
end

M.learn = function()
  print("from learn")
  -- Kinda like this:
  -- local lang = curl.get_lang()
  -- win.create_window(lang)
  --
  -- This way we can call :lua require('cheat.entry').learn()<CR>
  -- from whatever scope
end


return M

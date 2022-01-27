local curl = require "plenary.curl"
local filetype = require "plenary.filetype"

local M = {}

M.get_lang = function ()
  local lang = vim.fn.input("[Cheat.nvim] Select language, leave blank for current file [" .. vim.fn.expand('%:t') .. "]:", "")
  if lang == nil or lang == '' then
    lang = filetype.detect(vim.fn.expand('%:t'))
  end
  return lang
end

M.get_query = function ()
  local query = vim.fn.input("[Cheat.nvim] Type query: ", "")
  return query:gsub(" ", "+")
end

-- This should maybe take options for [Q] if we want questions or not
M.query = function(lang, lang_query, q)
  local res = curl.get("https://cheat.sh/" .. lang .. "/" .. lang_query .. "\\?T")
  return res.body
end

-- TODO: implement this for another keybind
M.learn = function(lang)
  local res = curl.get("https://cheat.sh/" .. lang .. "/:learn")
  return res.body
end

return M

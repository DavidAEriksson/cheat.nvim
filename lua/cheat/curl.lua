local curl = require "plenary.curl"

local M = {}

M.get_lang = function ()
  local lang = vim.fn.input("Language: ", "")
  return lang
end

M.get_query = function ()
  local query = vim.fn.input("Query: ", "")
  return query:gsub(" ", "+")
end

M.query = function(lang, lang_query)
  local res = curl.get("https://cheat.sh/" .. lang .. "/" .. lang_query)
  print(vim.inspect(res))
end

return M

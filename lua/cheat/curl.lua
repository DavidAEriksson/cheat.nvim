local curl = require "plenary.curl"
local filetype = require "plenary.filetype"

-- M
-- curl @global M
-- Contains all curl functions
local M = {}

-- Get input language from `vim.fn.input`
-- @returns `string` -> User selected language from file extension or `vim.fn.input`
M.get_lang = function ()
  local lang = vim.fn.input("[Cheat.nvim] Select language, leave blank for current file [" .. vim.fn.expand('%:t') .. "]:", "")
  if lang == nil or lang == '' then
    lang = filetype.detect(vim.fn.expand('%:t'))
  end
  return lang
end

-- Get question query from vim.fn.input
-- @returns `string` -> User submited query appended `string` with `+`.
-- example return: how to append string in lua -> how+to+append+string+in+lua
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
  local res = curl.get("cht.sh/" .. lang .. "/:learn" .. "\\?T")
  return res.body
end

return M

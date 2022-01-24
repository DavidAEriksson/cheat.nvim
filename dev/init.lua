package.loaded['dev'] = nil
package.loaded['cheat'] = nil
package.loaded['cheat.entry'] = nil
package.loaded['cheat.window'] = nil
package.loaded['cheat.curl'] = nil

vim.api.nvim_set_keymap('n', ',r', ':luafile dev/init.lua<CR>', {})

vim.api.nvim_set_keymap('n', ',w', ":lua require('cheat.entry').entry()<CR>", {noremap = true, silent = true})

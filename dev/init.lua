package.loaded['cheat'] = nil
package.loaded['cheat.window'] = nil
package.loaded['dev'] = nil

vim.api.nvim_set_keymap('n', '<leader>,r', ':luafile dev/init.lua<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>sh', ':lua require("cheat").window.create()<CR>', {noremap = true, silent = true})

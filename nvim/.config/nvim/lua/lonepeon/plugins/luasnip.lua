require('luasnip').setup({})

vim.keymap.set({ 'i', 's' }, '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set({ 'i', 's' }, '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')

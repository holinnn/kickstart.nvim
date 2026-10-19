vim.pack.add { { src = 'https://github.com/linrongbin16/gitlinker.nvim', name = 'gitlinker' } }

require('gitlinker').setup()

vim.keymap.set('n', '<leader>gy', '<cmd>GitLink<cr>')

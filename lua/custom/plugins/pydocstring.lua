vim.pack.add { { src = 'https://github.com/heavenshell/vim-pydocstring', name = 'pydocstring' } }

vim.keymap.set('n', '<C-_>', '<Plug>(pydocstring)', { desc = 'generate python docstring' })
vim.g.pydocstring_doq_path = '/usr/local/bin/doq'
vim.g.pydocstring_formatter = 'google'

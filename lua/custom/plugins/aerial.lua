vim.pack.add { { src = 'https://github.com/stevearc/aerial.nvim', name = 'aerial' } }

require('aerial').setup({
  layout = {
    default_direction = 'prefer_left',
    preserve_equality = true,
  },
})

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

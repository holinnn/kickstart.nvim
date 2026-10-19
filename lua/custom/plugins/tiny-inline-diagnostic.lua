vim.pack.add { { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim', name = 'tiny-inline-diagnostic' } }

require('tiny-inline-diagnostic').setup {
  options = {
    multilines = {
      enabled = true,
      always_show = true,
    },
    show_all_diags_on_cursorline = true,
  },
}

vim.keymap.set('n', '<leader>l', '<cmd>TinyInlineDiag toggle<cr>', { desc = 'Toggle diagnostics' })

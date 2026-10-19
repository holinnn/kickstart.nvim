-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/s1n7ax/nvim-window-picker',
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<leader>n', '<Cmd>Neotree toggle<CR>', { desc = 'NeoTree toggle', silent = true })

local function copy_path(state)
  -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
  -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local modify = vim.fn.fnamemodify

  local results = {
    filepath,
    modify(filepath, ':.'),
    modify(filepath, ':~'),
    filename,
    modify(filename, ':r'),
    modify(filename, ':e'),
  }

  vim.ui.select({
    '1. Absolute path: ' .. results[1],
    '2. Path relative to CWD: ' .. results[2],
    '3. Path relative to HOME: ' .. results[3],
    '4. Filename: ' .. results[4],
    '5. Filename without extension: ' .. results[5],
    '6. Extension of the filename: ' .. results[6],
  }, { prompt = 'Choose to copy to clipboard:' }, function(choice)
    if choice then
      local i = tonumber(choice:sub(1, 1))
      if i then
        local result = results[i]
        vim.fn.setreg('+', result)
        vim.notify('Copied: ' .. result)
      else
        vim.notify 'Invalid selection'
      end
    else
      vim.notify 'Selection cancelled'
    end
  end)
end

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true
    },
    window = {
      mappings = {
        ['n'] = 'close_window',
        ['S'] = 'split_with_window_picker',
        ['s'] = 'vsplit_with_window_picker',
        ['y'] = copy_path,
        ['<enter>'] = 'open_with_window_picker',
      },
    },
  },
}

require('window-picker').setup {
  hint = 'floating-big-letter',
}

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- optional but highly recommended for icons
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true, -- shows hidden files by default
        },
        follow_current_file = {
          enabled = true, -- focuses the file you are currently editing
        },
      },
      window = {
        width = 30,
        mappings = {
          ['<space>'] = 'none', -- disable space so it doesn't conflict with your leader
        },
      },
    }

    -- This creates the toggle shortcut: Space + e
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
  end,
}

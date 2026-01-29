return {
  -- 1. Copilot Code Completion (Ghost Text)
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-l>', -- Ctrl+l to accept
            accept_word = '<M-w>', -- Alt+w to accept word
            accept_line = '<M-l>', -- Alt+l to accept line
          },
        },
        panel = { enabled = false },
      }
    end,
  },

  -- 2. Copilot Chat (The "Sidebar")
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    opts = {
      window = {
        layout = 'vertical',
        width = 0.3,
      },
    },
    keys = {
      { '<leader>cc', ':CopilotChatToggle<CR>', desc = 'Toggle Copilot Chat Sidebar' },
      { '<leader>ce', ':CopilotChatExplain<CR>', desc = 'Explain Code' },
    },
  },
}

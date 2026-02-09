return {
  -- 1. Copilot Code Completion (Ghost Text)
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('copilot').setup {
        filetypes = {
          tex = false, -- Disable for LaTeX files
          plaintex = false, -- Disable for plain text files
          md = false, -- Disable for Markdown files
          ['*'] = true, -- Enable for all file types
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          copilot_model = 'gpt-4o-copilot',
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
      model = 'gpt-5.2',
      window = {
        layout = 'vertical',
        width = 0.3,
      },
      -- Allow the chat to access the context of all open buffers
      contexts = {
        buffer = { enabled = true },
        file = { enabled = true },
      },
    },
    keys = {
      { '<leader>cc', ':CopilotChatToggle<CR>', desc = 'Toggle Copilot Chat Sidebar' },
      { '<leader>co', '<cmd>CopilotChatOpen<cr>', desc = 'Open Chat' },
      { '<leader>cx', '<cmd>CopilotChatClose<cr>', desc = 'Close Chat' },
      { '<leader>ce', ':CopilotChatExplain<CR>', desc = 'Explain Code' },
      { '<leader>cr', ':CopilotChatReset<CR>', desc = 'Reset Chat' },
    },
  },
}

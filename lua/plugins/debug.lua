-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'cpptools', 'debugpy', 'delve'
      },
    }

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      name = 'vscode-cpptools',
      type = 'executable',
      command = 'OpenDebugAD7',
      attach = {
        pidProperty = "processId",
        pidSelect = "ask"
      }
    }

    dap.defaults.fallback.external_terminal = {
      command = '/usr/local/bin/st',
      args = { '-e' }
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<localleader>c', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<localleader>r', dap.restart, { desc = 'Debug: Restart' })
    vim.keymap.set('n', '<localleader>t', dap.terminate, { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<localleader>d', dap.disconnect, { desc = 'Debug: Disconnect' })
    vim.keymap.set('n', '<localleader>h', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<localleader>j', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<localleader>l', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<localleader>K', dap.up, { desc = 'Debug: Go up in stacktrace' })
    vim.keymap.set('n', '<localleader>J', dap.down, { desc = 'Debug: Go down in stacktrace' })
    vim.keymap.set('n', '<localleader>a', dap.list_breakpoints, { desc = 'Debug: List breakpoints' })
    vim.keymap.set('n', '<localleader>C', dap.clear_breakpoints, { desc = 'Debug: Clear breakpoints' })
    vim.keymap.set('n', '<localleader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<localleader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<localleader>o', dapui.open, { desc = 'Debug Widgets: Open session' })
    vim.keymap.set('n', '<localleader>v', dapui.toggle, { desc = 'Debug Widgets: See last session' })
    vim.keymap.set('n', '<localleader>q', dapui.close, { desc = 'Debug Widgets: Close' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()
  end,
}

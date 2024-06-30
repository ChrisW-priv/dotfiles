vim.keymap.set('n', '<F9>', ':lua require("dap").continue()<CR>')
vim.keymap.set('n', '<leader>n', ':lua require("dap").step_over()<CR>')
vim.keymap.set('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', ':lua require("dap").toggle_breakpoint(vim.fn.input("Break condition: "))<CR>')
vim.keymap.set('n', '<F12>', ':lua require("dapui").toggle()<CR>', {noremap=true, silent=true})

require("dap-python").setup("python")
require("dapui").setup({
    controls = {
      element = "repl",
      enabled = false,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 1
          },},
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "watches",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  })

local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}", -- This will run the current file
        pythonPath = function()
            -- Use the Python interpreter from the virtual environment created by Poetry
            local cwd = vim.fn.getcwd()
            local venv = cwd .. '/venv/bin/python3'
            if vim.fn.executable(venv) == 1 then
                return venv
            else
                -- Fallback to system Python if venv is not found
                return '/usr/bin/python3'
            end
        end,
    },
}




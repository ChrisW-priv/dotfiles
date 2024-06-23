vim.keymap.set('n', '<F9>', ':lua require("dap").continue()<CR>')
vim.keymap.set('n', '<leader>n', ':lua require("dap").step_over()<CR>')
vim.keymap.set('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', ':lua require("dap").toggle_breakpoint(vim.fn.input("Break condition: "))<CR>')
vim.keymap.set('n', '<F12>', ':lua require("dapui").toggle()<CR>', {noremap=true, silent=true})

require("dap-python").setup("python")
require("dapui").setup()

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
            local venv = cwd .. '/venv/bin/python'
            if vim.fn.executable(venv) == 1 then
                return venv
            else
                -- Fallback to system Python if venv is not found
                return '/usr/bin/python'
            end
        end,
    },
}




local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function ()
    builtin.find_files({
        hidden = true,
        file_ignore_patterns={
            "venv/*",
            "__pycache__/*",
            "ipynb_checkpoints/*",
            "node_packages/*",
            ".git/*"
        } })
end, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({search = vim.fn.input("Grep > ") })
end)

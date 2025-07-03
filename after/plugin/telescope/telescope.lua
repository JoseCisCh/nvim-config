local builtin = require('telescope.builtin')
vim.keymap.set('n',
    '<leader>pf',
    function ()
        builtin.find_files({
            find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" }
        })
    end,
    {
        desc = 'Telescope find files'
    }
)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

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

-- Configuring particlular Telescope colors.
-- Function to make Telescope transparent
local function telescope_transparent()
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "none" })
  --vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none" })
end

-- Reapply after colorscheme
--vim.api.nvim_create_autocmd("ColorScheme", {
--  callback = telescope_transparent,
--})

-- Call once on startup
telescope_transparent()

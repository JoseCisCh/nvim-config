--vim.api.nvim_create_autocmd("BufEnter", {
--    callback = function()
--        if vim.b.obsidian_vault then
--            vim.opt_local.conceallevel = 2
--        end
--    end
--})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown"},
    callback = function()
        -- Setting basic configuration.
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true

        -- Setting speficic obsidien configuration.
        local path = vim.fn.expand("%:p")
        local vaultRoot = vim.fn.expand("~") .. "/obsidian/vaults/*"
        if path:match("^" .. vaultRoot) then
            vim.opt_local.conceallevel = 2
        end
    end
})

require('lspconfig').ts_ls.setup({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", ".git"),
    settings = {
        javascript = { format = { semicolons = "insert" } },
        typescript = { format = { semicolons = "insert" } },
    }
})

require("mason").setup({})

local externalConfigurationServers = {
    jdtls = true,
}

local debugMode = false

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true -- Enable LSP snippets
require("mason-lspconfig").setup({
    ensure_installed = { "eslint", "pyright", "lua_ls", "ts_ls", "html", "cssls", "jsonls", "bashls", "lemminx", "clangd" },
    handlers = {
        function(server_name)
            if externalConfigurationServers[server_name] then
                if debugMode then
                    print("The server " .. server_name .. "is configured externally");
                end
            else
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities
                })
            end

            ts_ls = function()
                    require('lspconfig').ts_ls.setup({
                        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                        root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", ".git"),
                        settings = {
                            javascript = { format = { semicolons = "insert" } },
                            typescript = { format = { semicolons = "insert" } },
                        },
                        capabilities = capabilities
                    })
            end
        end
    }
})

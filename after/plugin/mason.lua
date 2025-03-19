require("mason").setup({})

require("mason-lspconfig").setup({
    ensure_installed = { "eslint", "pyright", "lua_ls", "ts_ls", "html", "cssls"},
    handlers = {
        function(server_name)
            if server_name == "jdtls" then
                print("not configuring java");
            else
                require('lspconfig')[server_name].setup({})
            end
        end
    }
})

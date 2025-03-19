require("mason").setup({})

local externalConfigurationServers = {
    jdtls = true,
}

local debugMode = false

require("mason-lspconfig").setup({
    ensure_installed = { "eslint", "pyright", "lua_ls", "ts_ls", "html", "cssls"},
    handlers = {
        function(server_name)
            if externalConfigurationServers[server_name] then
                if debugMode then
                    print("The server " .. server_name .. "is configured externally");
                end
            else
                require('lspconfig')[server_name].setup({})
            end
        end
    }
})

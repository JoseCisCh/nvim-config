require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "eslint", "pyright", "lua_ls", "ts_ls" },  -- Ensure jdtls is installed via mason
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end
	}
})

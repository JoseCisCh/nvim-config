-- Configuring LSP servers

require('lspconfig').jdtls.setup({
	cmd = {
		"/Users/josecisneros/.local/share/nvim/mason/bin/jdtls"
	},
	root_dir = require('lspconfig').util.root_pattern('.git', 'pom.xml', 'build.gradle'),
	settings = {
		java = {
			-- This will set JAVA_HOME for jdtls specifically
			--home = "/Users/josecisneros/.sdkman/candidates/java/21.0.6-amzn"
			runtimes = {
				{
					name = "JavaSE-1.8",
					path = "/Users/josecisneros/.sdkman/candidates/java/8.0.442-amzn",
					default = true,
				},
				{
					name = "JavaSE-17",
					path = "/Users/josecisneros/.sdkman/candidates/java/17.0.14-amzn",
				},
				{
					name = "JavaSE-21",
					path = "/Users/josecisneros/.sdkman/candidates/java/21.0.6-amzn",
				}
			}
		}
	}
})

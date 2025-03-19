--[[local home = os.getenv('HOME')
local config = {
    cmd = {
        home .. '/.local/share/nvim/mason/packages/jdtls/bin/jdtls',

    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml', 'build.gradle'}, { upward = true })[1]),

	settings = {
		java = {
            configuration = {
                -- This will set JAVA_HOME for jdtls specifically
                --home = "/Users/josecisneros/.sdkman/candidates/java/21.0.6-amzn"
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = home .. "/.sdkman/candidates/java/8.0.442-amzn/",
                        default = true,
                    },
                    {
                        name = "JavaSE-17",
                        path = home .. "/.sdkman/candidates/java/17.0.14-amzn",
                    },
                    {
                        name = "JavaSE-21",
                        path = home .. "/.sdkman/candidates/java/21.0.6-amzn",
                    }
                }

            }
		}
	}
}
require('jdtls').start_or_attach(config)--]]

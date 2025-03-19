-- This configuration is needed to make Java 21 work but
-- still be able to use other SDK versions.
vim.uv.os_setenv("JAVA_HOME", "/Users/josecisneros/.sdkman/candidates/java/21.0.6-amzn")

--[[local home = os.getenv('HOME')
local config = {
    cmd = {
        home .. '/.local/share/nvim/mason/packages/jdtls/bin/jdtls',

    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml', 'build.gradle'}, { upward = true })[1]),
    --root_dir = require('lspconfig').util.root_pattern('.git', 'pom.xml', 'build.gradle'),
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
                        path = home .. "/.sdkman/candidates/java/17.0.14-amzn/",
                    },
                    {
                        name = "JavaSE-21",
                        path = home .. "/.sdkman/candidates/java/21.0.6-amzn/",
                    }
                }

            }
        }
    }
}
require('jdtls').start_or_attach(config)..]]

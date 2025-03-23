
local home = os.getenv('HOME')
local bundles = {
    vim.fn.glob("/Users/josecisneros/.local/share/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true -- Enable LSP snippets
--vim.list_extend(bundles, vim.split(vim.fn.glob("/path/to/microsoft/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
    cmd = {
        home .. '/.local/share/nvim/mason/packages/jdtls/bin/jdtls',
        "-data", vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
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
    },
    init_options = {
        bundles = bundles,
    },
	capabilities = capabilities
}
require('jdtls').start_or_attach(config)

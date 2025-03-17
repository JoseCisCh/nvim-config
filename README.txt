In the case of Java LSP (jdlts) i had to make some hard coded configs in the SDK paths to make it work.

    - nvim JAVA_HOME variable was set to Corretto 21 in order to make jdlts work. This was made in java.lua file.
    - In lsp-config.lua I set the paths for the Java runtimes

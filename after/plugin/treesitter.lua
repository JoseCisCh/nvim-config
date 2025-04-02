require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "c",
        "html",
        "java",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
        "bash",
        "xml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    indent = {
        enable = true,
        disable = function(lang, bufnr)
            return lang ~= "xml"  -- Enable only for XML, disable for everything else
        end
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

require("coverage").setup({
    lang = "java",
    coverage_file = vim.fn.getcwd() .. "target/coverage.lcov"
})

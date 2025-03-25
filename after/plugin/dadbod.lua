local DB_CONN = os.getenv("DB_CONN")
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'sql',
    command = "DB b:db = " .. (DB_CONN or  "postgresql://localhost:5432/josecisneros")
})

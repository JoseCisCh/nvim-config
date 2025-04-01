-- Disable the global variable bellow to work also in XML.
-- have to check how to configure the file types to be enabled
-- automatically.
--vim.g.user_emmet_install_global = 0;
vim.g.user_emmet_leader_key ='<C-w>';
vim.api.nvim_create_autocmd('FileType', {
    pattern = {"*.html", "*.css", "*.xml"},
    command = "EmmetInstall"
})

-- This file is used to make commits of obsidian notes every 10 minutes in case that there
-- is a change in the notes repository.
local vault_root = vim.fn.expand("~") .. "/obsidian/vaults";
local timer = vim.uv.new_timer()


timer:start(600000, 600000, vim.schedule_wrap(function()
    local cwd = vim.fn.getcwd()

    if cwd:match("^" .. vault_root) then
        local changes = vim.fn.systemlist("git -C " .. cwd .. " status --porcelain")

        if #changes > 0 then
            local datetime = os.date("%Y-%m-%d %H:%M:%S")
            local message = "Auto commit from neovim at: " .. datetime
            vim.fn.system("git -C " .. cwd .. " add .")
            vim.fn.system("git -C " .. cwd .. " commit -m '" .. message .. "'")
            vim.fn.system("git -C " .. cwd .. " push")
        end
    end
end))

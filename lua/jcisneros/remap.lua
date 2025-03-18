vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Next two are for moving selected blocks easily
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Next one slight mod of J command to keep the
-- cursor in the same place.
vim.keymap.set("n", "J", "mzJ`z")

-- Next two to jump half page upwards or downwards
-- keeping cursor in the same hor position
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Next two for searching behavior
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Must check what these ones do
--[[vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)--]]

-- Allows to highlight and paste without loosing
-- previous deleted element in buffer.
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank into system clipboard easier
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--Deleting and sending to void to avoid keeping the
--deletion in the buffer (no Yanking)
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Simply becasue of the difference between Crtl-c
-- and Esc when editing vertically.
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Avoids entering in Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- I think this is for a plugin becasue is not doing anything.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Have to research this one
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Next 4 are for quickfix navigaton (applies if used to it)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Allows replacing all the occurrences of the selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Allows to change file mod to execution
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- This one I added it.
vim.api.nvim_set_keymap(
    "n",
    "<leader>e",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    { noremap = true, silent = true }
)

vim.g.mapleader = " "

-- Scroll
vim.keymap.set("n", "<c-e>", "3<c-e>")
vim.keymap.set("n", "<c-y>", "3<c-y>")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Copy and paste
vim.keymap.set("v", "p", "\"_dP")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
-- Switch window
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>")
-- Control buffer
vim.keymap.set("n", "<a-right>", ":bnext<CR>")
vim.keymap.set("n", "<a-left>", ":bprev<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
vim.keymap.set("n", "<leader>ba", ":bufdo bd<CR>")
vim.keymap.set("n", "<leader>bo", ":%bd|e#<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")
-- Control tab
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "td", ":tabclose<CR>")

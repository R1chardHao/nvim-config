vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>glf", ":DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<leader>glb", ":DiffviewFileHistory .<CR>")

require('gitsigns').setup()

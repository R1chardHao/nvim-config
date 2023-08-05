return {
    {"tpope/vim-fugitive"},

    {
        "sindrets/diffview.nvim",
        config = function ()
            vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
            vim.keymap.set("n", "<leader>glf", ":DiffviewFileHistory %<CR>")
            vim.keymap.set("n", "<leader>glb", ":DiffviewFileHistory .<CR>")
        end
    },

    { "lewis6991/gitsigns.nvim", config = true, },
}

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.txt",
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("wincmd L")
        end
    end,
})

return {
    {
        "tpope/vim-fugitive",
        enabled = false
    },

    {
        "sindrets/diffview.nvim",
        config = function ()
            vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
            vim.keymap.set("n", "<leader>glf", ":DiffviewFileHistory %<CR>")
            vim.keymap.set("n", "<leader>glb", ":DiffviewFileHistory .<CR>")
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, {expr=true})

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, {expr=true})

                -- Actions
                map('n', '<leader>hr', gs.reset_hunk)
                map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('n', '<leader>hR', gs.reset_buffer)
                map('n', '<leader>hp', gs.preview_hunk)
            end
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
        },
        config = function ()
            local neogit = require('neogit')
            neogit.setup {}
            vim.api.nvim_create_user_command( 'Git', 'Neogit', {})
        end,
    }
}

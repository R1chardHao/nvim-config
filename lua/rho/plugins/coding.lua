return {
    {'jiangmiao/auto-pairs'},


    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },


    {
        'echasnovski/mini.surround',
        config = function()
            require('mini.surround').setup()
        end
    },

    -- Highlight same word
    {'RRethy/vim-illuminate'},

    {
        "echasnovski/mini.bufremove",
        config = function ()
            require('mini.bufremove').setup()

            local nvimTreeApi = require("nvim-tree.api")
            local function deleteBuffer()
                if (nvimTreeApi.tree.is_visible()) then
                    MiniBufremove.delete()
                else
                    vim.cmd('bd')
                end
            end

            vim.keymap.set('n', '<leader>x', deleteBuffer)
        end
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true,
                },
            })
            -- REQUIRED

            -- keymap
            vim.keymap.set("n", "<leader>Ha", function()
                harpoon:list():append()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
            vim.keymap.set("n", "<leader>Hv", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        end
    },

    -- AI assistant
    { "Exafunction/codeium.vim" },
}

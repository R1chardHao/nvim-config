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

    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = function ()
            vim.o.foldcolumn = '0' -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            local ufo = require('ufo')
            vim.keymap.set('n', 'zR', ufo.openAllFolds)
            vim.keymap.set('n', 'zM', ufo.closeAllFolds)

            ufo.setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
            })
        end
    },

    -- AI assistant
    { "Exafunction/codeium.vim" },
}

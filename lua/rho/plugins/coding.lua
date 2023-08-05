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
    }
}

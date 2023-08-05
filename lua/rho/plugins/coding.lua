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
    {'RRethy/vim-illuminate'}
}

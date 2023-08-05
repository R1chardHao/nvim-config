return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            layout_config = {
                vertical = {
                    preview_cutoff = 0,
                },
            },
            path_display = { truncate = 3 },
        }
    },

    config = function ()
        local function getVisualSelection()
            vim.cmd('noau normal! "vy"')
            local text = vim.fn.getreg('v')
            vim.fn.setreg('v', {})

            text = string.gsub(text, "\n", "")
            if #text > 0 then
                return text
            else
                return ''
            end
        end

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('v', '<leader>ff', function() builtin.find_files({ default_text=getVisualSelection() }) end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('v', '<leader>fg', function() builtin.live_grep({ default_text=getVisualSelection() }) end, {})
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
        vim.keymap.set('v', '<leader>fs', function() builtin.grep_string({ search=getVisualSelection() }) end, {})
        vim.keymap.set('n', '<leader>bl', builtin.buffers, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', 'gr', function ()
            builtin.lsp_references({
                layout_strategy = 'vertical',
                layout_config = {width = 0.8},
                show_line = false
            })
        end, {})
    end
}

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function ()
    require('telescope').setup{
      defaults = require('telescope.themes').get_ivy {
        path_display = { truncate = 3 },
      },
    }

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
    vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end, {})
    vim.keymap.set('v', '<leader>ff', function() builtin.find_files({ default_text=getVisualSelection() }) end, {})
    vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end, {})
    vim.keymap.set('v', '<leader>fg', function() builtin.live_grep({ default_text=getVisualSelection() }) end, {})
    vim.keymap.set('n', '<leader>fw', function() builtin.grep_string() end, {})
    vim.keymap.set('v', '<leader>fw', function() builtin.grep_string({ search=getVisualSelection() }) end, {})
    vim.keymap.set('n', '<leader>bl', function() builtin.buffers() end, {})
    vim.keymap.set('n', '<C-p>', function() builtin.git_files() end, {})
    vim.keymap.set('n', '<leader>fs', function() builtin.lsp_document_symbols() end, {})
    vim.keymap.set('n', 'gr', function () builtin.lsp_references({ show_line = false }) end, {})
    vim.keymap.set('n', '<leader>fgs', function() builtin.git_stash() end, {})
  end
}

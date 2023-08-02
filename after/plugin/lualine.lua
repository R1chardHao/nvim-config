local function trunc(max_len)
    return function(str)
        if #str > max_len then
            return str:sub(1, max_len) .. ('...')
        end
        return str
    end
end

require("lualine").setup {
    options = {
        theme = 'auto',
        globalstatus = true
    },
    sections = {
        lualine_b = {
            {'branch', fmt=trunc(30)},
            'diff',
            'diagnostics'
        },
        lualine_c = {
            {'filename', path=1}
        }
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_z = {'tabs'}
    }
}

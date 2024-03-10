return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- empty setup using defaults
            require("nvim-tree").setup({
                view = {
                    width = 60
                }
            })

            local function open_nvim_tree(data)
                -- buffer is a directory
                local directory = vim.fn.isdirectory(data.file) == 1

                if not directory then
                    return
                end

                -- change to the directory
                vim.cmd.cd(data.file)

                -- open the tree
                require("nvim-tree.api").tree.open()
            end

            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree})

            -- keymap
            vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
            vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>")
        end,
    },

    {
        "navarasu/onedark.nvim",
        config = function ()
            require('onedark').load()
            vim.cmd.colorscheme("onedark")
        end
    },


	{ 
        "nvim-lualine/lualine.nvim",
		dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function ()
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
                    theme = 'dracula',
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
        end
    },
}

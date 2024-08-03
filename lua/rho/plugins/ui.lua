return {
  {
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ["<BS>"] = "actions.parent"
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'echasnovski/mini.files',
    config = function ()
      require('mini.files').setup()
      vim.keymap.set('n', '<leader>ee', MiniFiles.open)
      vim.keymap.set('n', '<leader>ef', function ()
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end)
    end
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

-- Wiki https://github.com/nvim-tree/nvim-tree.lua/wiki

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

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

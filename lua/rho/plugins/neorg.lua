return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Notes",
            },
            default_workspace = "notes"
          },
          ["core.ui.calendar"] = {},
        },
        ["core.keybinds"] = {
          config = {
            neorg_leader = ","
          }
        }
      },
    }

    vim.api.nvim_create_user_command( 'Org', 'Neorg index', {})
    vim.api.nvim_create_user_command( 'Diary', 'Neorg journal today', {})
    vim.api.nvim_create_user_command( 'DiaryToc', 'Neorg journal toc', {})
  end,
},
}

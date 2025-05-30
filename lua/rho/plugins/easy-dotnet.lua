return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
  config = function()
    require("easy-dotnet").setup({
      auto_bootstrap_namespace = {
        type = "file_scoped",
        enabled = true
      },
    })
  end
}

----------------
-- lsp-zero
----------------
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
      buffer = bufnr,
      omit = {'gr'}
  })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()


----------------
-- Autocompletion
----------------
local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_mappings = {
    ['<C-Space>'] = cmp.mapping.complete(),

    ['<C-j>'] = cmp.mapping(function()
        -- Show comlete menu for luasnip only
        cmp.complete({
            config = {
                sources = {
                    {name = 'luasnip'}
                }
            }
        })
    end, {"i"}),

    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                cmp.confirm()
            end
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, {"i","s","c",}),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp_mappings,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
    preselect = 'item', -- make Autocompletion preselect first item
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = cmp_mappings["<Tab>"]
    }),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

----------------
-- diagnostic
----------------
vim.diagnostic.config({
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR
    },
})

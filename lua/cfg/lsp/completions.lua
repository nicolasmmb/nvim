-- local cmp = require("cmp")
-- cmp.setup(
--     {
--         snippet = {
--             expand = function(args)
--                 require("luasnip").lsp_expand(args.body)
--             end
--         },
--         mapping = cmp.mapping.preset.insert(
--             {
--                 ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--                 ["<C-f>"] = cmp.mapping.scroll_docs(4),
--                 ["<C-Space>"] = cmp.mapping.complete(),
--                 ["<C-e>"] = cmp.mapping.close(),
--                 ["<CR>"] = cmp.mapping.confirm(
--                     {
--                         behavior = cmp.ConfirmBehavior.Replace,
--                         select = true
--                     }
--                 ),
--                 ["<Tab>"] = cmp.mapping.select_next_item(),
--                 ["<S-Tab>"] = cmp.mapping.select_prev_item()
--             }
--         ),
--         sources = cmp.config.sources(
--             {
--                 {
--                     name = "nvim_lsp"
--                 }, {
--                     name = "buffer"
--                 }, {
--                     name = "path"
--                 }, {
--                     name = "luasnip"
--                 }
--             }
--         ),
--         formatting = {
--             format = lspkind.cmp_format(
--                 {
--                     maxwidth = 96,
--                     ellipsis_char = "..."
--                 }
--             )
--         }
--     }
-- )
local cmp = require("cmp")

cmp.setup(
    {
        mapping = cmp.mapping.preset.insert(
            {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-o>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm(
                    {
                        select = true
                    }
                )
            }
        ),
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        sources = cmp.config.sources(
            {
                {
                    name = 'nvim_lsp'
                }, {
                    name = 'luasnip'
                }
            }, {
                {
                    name = 'buffer'
                }
            }
        )
    }
)

return {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "onsails/lspkind-nvim", "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets"
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        require("luasnip/loaders/from_vscode").lazy_load()
        vim.opt.completeopt = "menu,menuone,noselect"

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
        --                     -- with_text = true,
        --                     -- menu = {
        --                     --     buffer = "[Buffer]",
        --                     --     nvim_lsp = "[LSP]",
        --                     --     luasnip = "[LuaSnip]",
        --                     --     path = "[Path]"
        --                     -- }
        --                     maxwidth = 96,
        --                     ellipsis_char = "..."
        --                 }
        --             )
        --         }

        --     }
        -- )
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
                        }, {
                            name = "copilot",
                            group_index = 2
                        }
                    }, {
                        {
                            name = 'buffer'
                        }
                    }

                )
            }
        )

    end
}

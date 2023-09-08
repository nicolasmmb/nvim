return {
    {
        'romgrk/barbar.nvim',
        dependencies = {
            --- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            --- 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = true,
            auto_hide = false
        },
        icons = {
            buffer_index = false,
            buffer_number = false,
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {
                    enabled = true,
                    icon = 'ﬀ'
                },
                [vim.diagnostic.severity.WARN] = {
                    enabled = false
                },
                [vim.diagnostic.severity.INFO] = {
                    enabled = false
                },
                [vim.diagnostic.severity.HINT] = {
                    enabled = true
                }
            },
            gitsigns = {
                added = {
                    enabled = true,
                    icon = '+'
                },
                changed = {
                    enabled = true,
                    icon = '~'
                },
                deleted = {
                    enabled = true,
                    icon = '-'
                }
            },
            separator = {
                left = '▎',
                right = ''
            },
            separator_at_end = true,
            modified = {
                button = '●'
            },
            pinned = {
                button = '',
                filename = true
            }
        },
        preset = 'powerline',

        version = '^1.0.0' -- optional: only update when a new 1.x version is released
    }
}

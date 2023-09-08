return {
    "nvim-tree/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()

        local nvimtree = require("nvim-tree")

        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        -- set color for arrows in tree
        vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

        -- OR setup with some options
        nvimtree.setup(
            {
                sort_by = "case_sensitive",
                view = {
                    width = 35,
                    relativenumber = true
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_open = "",
                                arrow_closed = ""
                            }
                        }
                    }
                },
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false
                        }
                    }
                },
                filters = {
                    dotfiles = false,
                    custom = {"node_modules", ".DS_Store"}
                },
                git = {
                    ignore = true
                }
            }
        )
    end

}

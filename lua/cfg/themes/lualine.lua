return {
    'nvim-lualine/lualine.nvim',
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local lualine = require('lualine')
        local lazy_status = require('lazy.status')

        local colors = {
            bg = '#112638',
            fg = '#C3CCDC',
            inactive_bg = '#3E4B59',
            violet = '#FF61EF',
            yellow = '#FFDA7B',
            green = '#A6E22E',
            blue = '#3FC5FF',
            red = '#FF6C6B'
        }

        local std = {
            normal = {
                a = {
                    fg = colors.bg,
                    bg = colors.blue,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                },
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            },
            insert = {
                a = {
                    fg = colors.bg,
                    bg = colors.green,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                },
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            },
            visual = {
                a = {
                    fg = colors.bg,
                    bg = colors.violet,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                },
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            },
            command = {
                a = {
                    fg = colors.bg,
                    bg = colors.yellow,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                },
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            },
            replace = {
                a = {
                    fg = colors.bg,
                    bg = colors.red,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                },
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            },
            inactive = {
                a = {
                    fg = colors.fg,
                    bg = colors.inactive_bg,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                },
                c = {
                    fg = colors.fg,
                    bg = colors.inactive_bg
                }
            }
        }

        lualine.setup(
            {
                options = {
                    theme = std
                },
                sections = {
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = {
                                fg = "#ff9e64"
                            }
                        }, {"encoding"}, {"fileformat"}, {"filetype"}
                    },
                    --- branch
                    lualine_y = {
                        {
                            lazy_status.branch,
                            cond = lazy_status.has_branch,
                            color = {
                                fg = "#ff9e64"
                            }
                        }

                    }
                }
            }
        )

    end
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = {"BufReadPre", "BufNewFile"},
        build = ":TSUpdate",
        dependencies = {"windwp/nvim-ts-autotag"},
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            local LANG_PARSER = {
                ---
                "make", --- Make
                "cmake", --- Cmake
                "bash", --- Bash
                "dart", --- Dart
                "dockerfile", --- Docker
                "terraform", --- Terraform
                ---
                "go", --- Go
                "gosum", --- Go
                "gowork", --- Go
                "javascript", --- JavaScript
                "typescript", --- TypeScript
                "python", --- Python
                "sql", --- SQL
                "lua", --- Lua
                "graphql", --- GraphQL
                "rust", --- Rust
                "proto", --- Protocol Buffers
                "promql", --- Prometheus
                ---
                "toml", --- TOML
                "yaml", --- YAML
                "json", --- JSON
                "xml", --- XML
                ---
                "html", --- HTML
                "css", --- CSS
                "markdown", --- Markdown
                ---
                "prisma", --- Prisma
                "regex" --- Regex
            }

            -- configure treesitter
            treesitter.setup(
                { -- enable syntax highlighting
                    highlight = {
                        enable = true
                    },
                    -- enable indentation
                    indent = {
                        enable = true
                    },
                    -- enable autotagging (w/ nvim-ts-autotag plugin)
                    autotag = {
                        enable = true
                    },
                    -- ensure these language parsers are installed
                    ensure_installed = LANG_PARSER,

                    context_commentstring = {
                        enable = true,
                        enable_autocmd = false
                    },

                    auto_install = true
                }
            )
        end
    }
}

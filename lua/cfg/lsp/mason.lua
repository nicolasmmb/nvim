return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim" ---
        -- "jayp0521/mason-null-ls.nvim" ---
    },

    config = function()
        local mason = require("mason")
        local mason_lsp = require("mason-lspconfig")
        -- local mason_null_ls = require("mason-null-ls")

        mason.setup(
            {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }

                }
            }
        )

        local LSP_SERVERS = {
            ---
            "cmake", --- CMake
            "bashls", --- Bash
            "dockerls", --- Docker
            "ansiblels", --- Ansible
            "terraformls", --- Terraform
            "docker_compose_language_service", --- Docker Compose
            ---
            "gopls", --- Go
            "sourcery", --- Python 
            "ruff_lsp", --- Python
            "tsserver", --- TypeScript
            "sqlls", --- SQL
            "lua_ls", --- Lua
            "graphql", --- GraphQL
            "rust_analyzer", --- Rust
            ---
            "taplo", --- TOML
            "yamlls", --- YAML
            "jsonls", --- JSON
            "lemminx", --- XML
            ---
            "html", --- HTML
            "cssls", --- CSS
            "tailwindcss", --- Tailwind CSS
            "marksman", --- Markdown
            ---
            "spectral", --- OpenAPI
            "prismals" --- Prisma
            ---
            --- Deactivated
            -- "eslint", --- JavaScript

        }

        mason_lsp.setup(
            {
                ensure_installed = LSP_SERVERS,
                automatic_installation = true
            }
        )

        -- mason_null_ls.setup({})

    end
}


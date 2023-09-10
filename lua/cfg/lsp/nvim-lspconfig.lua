return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "antosha417/nvim-lsp-file-operations",
            config = true
        },

        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local keymap = vim.keymap
            local opts = {
                noremap = true,
                silent = true
            }
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr

                -- keymap
                opts.desc = "Show LSP Definitions and References"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) --

                opts.desc = "Go To Declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) --

                opts.desc = "Show LSP Definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) --

                opts.desc = "Show LSP Implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) --

                opts.desc = "Show LSP Type Definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) --

                opts.desc = "See available code actions"
                keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) --

                opts.desc = "Smart Rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) --

                opts.desc = "Show Buffer Diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) --

                opts.desc = "Show Line Diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) --

                opts.desc = "Jump To Previous Diagnostic In Buffer"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) --

                opts.desc = "Jump To Next Diagnostic In Buffer"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) --

                opts.desc = "Show Documentation For What Is Under Cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) --

                opts.desc = "Mapping To Restart LSP If Needed"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) --
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local signs = {
                Error = " ",
                Warning = " ",
                Hint = " ",
                Information = " "
            }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(
                    hl, {
                        text = icon,
                        texthl = hl,
                        numhl = ""
                    }
                )
            end

            --- Configurations To Language Servers
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

            -- Bash
            lspconfig["bashls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- CMake
            lspconfig["cmake"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Docker
            lspconfig["dockerls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Ansible
            lspconfig["ansiblels"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Terraform
            lspconfig["terraformls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Docker Compose
            lspconfig["docker_compose_language_service"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Go
            lspconfig["gopls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    filetypes = {"go", "gomod"}
                }
            )

            -- Python
            lspconfig["sourcery"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                    -- filetypes = {"python", "py"}
                }
            )

            lspconfig["ruff_lsp"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                    -- filetypes = {"python", "py"}
                }
            )

            -- TypeScript / JavaScript
            lspconfig["tsserver"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- SQL
            lspconfig["sqlls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Lua
            lspconfig["lua_ls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- GraphQL
            lspconfig["graphql"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Rust
            lspconfig["rust_analyzer"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- TOML
            lspconfig["taplo"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- YAML
            lspconfig["yamlls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- JSON
            lspconfig["jsonls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- XML
            lspconfig["lemminx"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- HTML
            lspconfig["html"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- CSS
            lspconfig["cssls"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Tailwind CSS
            lspconfig["tailwindcss"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Markdown
            lspconfig["marksman"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- OpenAPI
            lspconfig["spectral"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- Prisma
            lspconfig["prismals"].setup(
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            )

            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup(
                {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = { -- custom settings for lua
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = {"vim"}
                            },
                            workspace = {
                                -- make language server aware of runtime files
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true
                                }
                            }
                        }
                    }
                }
            )

        end
    }
}

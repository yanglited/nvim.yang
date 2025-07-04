return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                    "dockerls",
                    "docker_compose_language_service",
                    "pyright",
                    "texlab",
                },
            })
        end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "clang-format",
                    "black",
                    "isort",
                    "shellharden",
                    "cmakelang",
                    "latexindent",
                    "prettier",
                },
                auto_update = true,
                run_on_start = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local opts = { noremap = true, silent = true }
            -- used to enable autocompletion (assign to every lsp server config)
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()
            local on_attach = function(bufnr)
                opts.buffer = bufnr

                local wk = require("which-key")
                wk.add({
                    { "<leader>c", group = "Code related" },
                    { "<leader>cD", ":Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics" },
                    { "<leader>ca", vim.lsp.buf.code_action, desc = "See code actions" },
                    { "<leader>cc", vim.lsp.buf.hover, desc = "Show doc for what is under cursor" },
                    { "<leader>cd", vim.diagnostic.open_float, desc = "Show line diagnostic" },
                    { "<leader>cl", vim.lsp.buf.declaration, desc = "Show declaration" },
                    { "<leader>cn", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
                    { "<leader>cp", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
                    { "<leader>cr", vim.lsp.buf.rename, desc = "Smart rename" },
                    { "<leader>l", group = "Lsp related" },
                    { "<leader>lc", ":Telescope lsp_incoming_calls<CR>", desc = "Show incoming calls" },
                    { "<leader>ld", ":Telescope lsp_definitions<CR>", desc = "Show lsp definitions" },
                    { "<leader>li", ":Telescope lsp_implementations<CR>", desc = "Show lsp implementations" },
                    { "<leader>lo", ":Telescope lsp_outgoing_calls<CR>", desc = "Show outgoing calls" },
                    { "<leader>lr", ":Telescope lsp_references<CR>", desc = "Show lsp references" },
                    { "<leader>ls", ":Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Show dynamic workspace symbols" },
                    { "<leader>lt", ":Telescope lsp_type_definitions<CR>", desc = "Show lsp type definitions" },
                    { "<leader>lw", ":Telescope lsp_workspace_symbols<CR>", desc = "Show workspace symbols" },
                })
            end
            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = "󰠠 ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    },
                },
            })
            lspconfig["bashls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["clangd"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["dockerls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["docker_compose_language_service"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig["texlab"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end
    },
}

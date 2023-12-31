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
                    "beautysh",
                    "cmakelang",
                },
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
            lspconfig.lua_ls.setup({})
            local opts = { noremap = true, silent = true }
            -- used to enable autocompletion (assign to every lsp server config)
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()
            local on_attach = function(bufnr)
                opts.buffer = bufnr

                local wk = require("which-key")
                wk.register({
                    ["<leader>c"] = {
                        name = "Code related",
                        a = { vim.lsp.buf.code_action,   "See code actions", opts },
                        c = { vim.lsp.buf.hover,         "Show doc for what is under cursor", opts },
                        r = { vim.lsp.buf.rename,        "Smart rename", opts },
                        l = { vim.lsp.buf.declaration,   "Show declaration", opts },
                        d = { vim.diagnostic.open_float, "Show line diagnostic", opts },
                        p = { vim.diagnostic.goto_prev,  "Previous Diagnostic", opts },
                        n = { vim.diagnostic.goto_next,  "Next Diagnostic", opts },
                        D = { ":Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", opts },
                    },
                    ["<leader>l"] = {
                        name = "Lsp related",
                        r = { ":Telescope lsp_references<CR>",  "Show lsp references", opts },
                        d = { ":Telescope lsp_definitions<CR>", "Show lsp definitions", opts },
                        i = { ":Telescope lsp_implementations<CR>", "Show lsp implementations", opts },
                        t = { ":Telescope lsp_type_definitions<CR>", "Show lsp type definitions", opts },
                    },
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

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
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
        end
    },
}

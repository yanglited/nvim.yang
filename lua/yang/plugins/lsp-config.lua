return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = {
                    exclude = { "stylua" },
                },
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                    "dockerls",
                    "docker_compose_language_service",
                    "pyright",
                    "ts_ls",
                    "texlab",
                },
            })
        end,
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
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- Apply blink.cmp capabilities to all LSP servers
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            -- Diagnostic signs
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
                virtual_text = true,
            })

            -- Keybindings on LspAttach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
                callback = function(args)
                    local buf = args.buf
                    local wk = require("which-key")
                    wk.add({
                        { "<leader>c", group = "Code related", buffer = buf },
                        { "<leader>cD", ":Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics", buffer = buf },
                        { "<leader>ca", vim.lsp.buf.code_action, desc = "See code actions", buffer = buf },
                        { "<leader>cc", vim.lsp.buf.hover, desc = "Show doc for what is under cursor", buffer = buf },
                        { "<leader>cd", vim.diagnostic.open_float, desc = "Show line diagnostic", buffer = buf },
                        { "<leader>cl", vim.lsp.buf.declaration, desc = "Show declaration", buffer = buf },
                        {
                            "<leader>cn",
                            function() vim.diagnostic.jump({ count = 1, float = true }) end,
                            desc = "Next Diagnostic",
                            buffer = buf,
                        },
                        {
                            "<leader>cp",
                            function() vim.diagnostic.jump({ count = -1, float = true }) end,
                            desc = "Previous Diagnostic",
                            buffer = buf,
                        },
                        { "<leader>cr", vim.lsp.buf.rename, desc = "Smart rename", buffer = buf },
                        { "<leader>l", group = "Lsp related", buffer = buf },
                        { "<leader>lc", ":Telescope lsp_incoming_calls<CR>", desc = "Show incoming calls", buffer = buf },
                        { "<leader>ld", ":Telescope lsp_definitions<CR>", desc = "Show lsp definitions", buffer = buf },
                        { "<leader>li", ":Telescope lsp_implementations<CR>", desc = "Show lsp implementations", buffer = buf },
                        { "<leader>lo", ":Telescope lsp_outgoing_calls<CR>", desc = "Show outgoing calls", buffer = buf },
                        { "<leader>lr", ":Telescope lsp_references<CR>", desc = "Show lsp references", buffer = buf },
                        { "<leader>ls", ":Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Show dynamic workspace symbols", buffer = buf },
                        { "<leader>lt", ":Telescope lsp_type_definitions<CR>", desc = "Show lsp type definitions", buffer = buf },
                        { "<leader>lw", ":Telescope lsp_workspace_symbols<CR>", desc = "Show workspace symbols", buffer = buf },
                    })
                end,
            })
        end,
    },
}

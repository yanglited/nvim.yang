return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                sh = { "shellharden" },
                bash = { "shellharden" },
                cmake = { "cmake_format" },
                latex = { "latexindent" },
                tex = { "latexindent" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })

        local wk = require("which-key")
        wk.add({
            { "<leader>n", group = "Format" },
            {
                "<leader>nf",
                function() conform.format({ async = true, lsp_format = "fallback" }) end,
                desc = "Format",
            },
        })
    end,
}

return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            -- to support another formatter, find in in :Mason
            -- then include in mason-tool-installer ensure_installed list
            -- then add it in the sources table below
            sources = {
                null_ls.builtins.formatting.stylua, -- lua
                null_ls.builtins.formatting.black, -- python
                null_ls.builtins.formatting.isort, -- python imports
                null_ls.builtins.formatting.clang_format, -- c/c++
                null_ls.builtins.formatting.shellharden, -- bash
                null_ls.builtins.formatting.cmake_format, -- cmake
            },
        })
        local wk = require("which-key")
        wk.add({
            { "<leader>n", group = "None-ls Tools" },
            { "<leader>nf", vim.lsp.buf.format, desc = "Format" },

        })
    end,
}

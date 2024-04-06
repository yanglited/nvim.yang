return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").setup({
            pickers = {
                find_files = { hidden = true },
                live_grep = { additional_args = { "--hidden" } },
                grep_string = { additional_args = { "--hidden" } },
            },
        })
        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = {
                name = "Find ...",
                f = { ":Telescope find_files<cr>", "Find files" },
                w = { ":Telescope live_grep<cr>", "Live grep" },
                h = { ":Telescope help_tags<cr>", "Find help tags" },
                g = { ":Telescope grep_string<cr>", "Find word under cursor" },
                i = { ":Telescope git_files<cr>", "Find git files" },
                e = { ":Telescope help_tags<cr>", "Find help tags" },
                r = { ":Telescope registers<cr>", "Find registers" },
                b = { ":Telescope buffers<cr>", "Find buffers" },
                z = { ":Telescope current_buffer_fuzzy_find<cr>", "Find fuzzy find in current buffer" },
            },
        })
    end,
}

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
        wk.add({
            { "<leader>f", group = "Find ..." },
            { "<leader>fb", ":Telescope buffers<cr>", desc = "Find buffers" },
            { "<leader>fe", ":Telescope help_tags<cr>", desc = "Find help tags" },
            { "<leader>ff", ":Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", ":Telescope grep_string<cr>", desc = "Find word under cursor" },
            { "<leader>fh", ":Telescope help_tags<cr>", desc = "Find help tags" },
            { "<leader>fi", ":Telescope git_files<cr>", desc = "Find git files" },
            { "<leader>fr", ":Telescope registers<cr>", desc = "Find registers" },
            { "<leader>fw", ":Telescope live_grep<cr>", desc = "Live grep" },
            { "<leader>fz", ":Telescope current_buffer_fuzzy_find<cr>", desc = "Find fuzzy find in current buffer" },
        })
    end,
}

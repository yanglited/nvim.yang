return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- config = true,
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup()
        local wk = require("which-key")
        wk.add({
            { "<leader>G", group = "Gitsigns..." },
            { "<leader>Gb", ":Gitsigns blame_line<cr>", desc = "Blame line" },
            { "<leader>Gd", ":Gitsigns diffthis<cr>", desc = "Diff this" },
            { "<leader>Gn", ":Gitsigns next_hunk<cr>", desc = "Next hunk" },
            { "<leader>Gp", ":Gitsigns prev_hunk<cr>", desc = "Prev hunk" },
            { "<leader>Gr", ":Gitsigns refresh<cr>", desc = "Refresh" },
        })
    end,
}

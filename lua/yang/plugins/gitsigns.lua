return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- config = true,
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup()
        local wk = require("which-key")
        wk.register({
            ["<leader>G"] = {
                name = "Gitsigns...",
                n = { ":Gitsigns next_hunk<cr>", "Next hunk" },
                p = { ":Gitsigns prev_hunk<cr>", "Prev hunk" },
                b = { ":Gitsigns blame_line<cr>", "Blame line" },
                d = { ":Gitsigns diffthis<cr>", "Diff this" },
                r = { ":Gitsigns refresh<cr>", "Refresh" },
            },
        })
    end,
}

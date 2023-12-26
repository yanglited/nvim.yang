return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = {
                name = "Find ...",
                f = {":Telescope find_files<cr>", "Find files"},
                w = {":Telescope live_grep<cr>",  "Live grep"},
                h = {":Telescope help_tags<cr>",  "Find help tags"},
            }
        })
    end,
}

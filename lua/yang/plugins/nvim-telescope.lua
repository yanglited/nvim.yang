return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        -- add a keymap to browse plugin files
        -- stylua: ignore
        {
            "<leader>f",
            desc = "Find things",
        },
        {
            "<leader>fp",
            function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
            desc = "Find Plugin File",
        },
        {
            "<leader>ff",
            function() require("telescope.builtin").find_files() end,
            desc = "Find Files",
        },
        {
            "<leader>fw",
            function() require("telescope.builtin").live_grep() end,
            desc = "Find Words (live grep)",
        },
        {
            "<leader>fh",
            function() require("telescope.builtin").help_tags() end,
            desc = "Find Help Tags",
        },
    },
    -- change some options
    opts = {
        defaults = {
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            winblend = 0,
        },
    },
}

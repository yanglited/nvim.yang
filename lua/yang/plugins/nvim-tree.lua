return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>e", group = "File explorer" },
            { "<leader>ec", ":NvimTreeCollapse<cr>", desc = "Collapse fire explorer" },
            { "<leader>ee", ":NvimTreeFocus<cr>", desc = "Focus on file explorer" },
            { "<leader>ef", ":NvimTreeFindFile<cr>", desc = "Focus on current file" },
            { "<leader>er", ":NvimTreeRefresh<cr>", desc = "Refresh file explorer" },
            { "<leader>et", ":NvimTreeToggle<cr>", desc = "Toggle file explorer" },
        })
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup({
            view = {
                width = 35,
                relativenumber = true,
                adaptive_size = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

    end,
}

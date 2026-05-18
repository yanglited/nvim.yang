return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            require("nvim-treesitter").install({
                "bash",
                "lua",
                "python",
                "dockerfile",
                "c",
                "cpp",
                "cmake",
                "markdown",
                "markdown_inline",
                "latex",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "svelte",
                "graphql",
                "vim",
                "vimdoc",
                "query",
                "gitignore",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.bo[args.buf].indentexpr =
                            "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })

            require("nvim-ts-autotag").setup({})
        end,
    },
}

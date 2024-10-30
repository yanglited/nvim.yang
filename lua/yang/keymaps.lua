-- center the cursor to middle of screen when scrolling up and down:
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- in normal and visual modes, yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank to end of line, Y is equivalent to y$
vim.keymap.set("n", "<leader>p", [["+p]]) -- paste from system clipboard
vim.keymap.set("n", "<leader>P", [["+P]]) -- paste from system clipboard

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- clear search highlights
vim.keymap.set("n", "<Esc>", ":nohl<CR>")

local wk = require("which-key")
wk.add({
    { "<leader>t", group = "Tabs" },
    { "<leader>tn", ":tabn<cr>", desc = "Go to next tab" },
    { "<leader>to", ":tabnew<cr>", desc = "Open new tab" },
    { "<leader>tp", ":tabp<cr>", desc = "Go to previous tab" },
    { "<leader>tx", ":tabclose<cr>", desc = "Close current tab" },
})

wk.add({
    { "<leader>s", group = "Splits/window" },
    { "<leader>se", "<C-w>=", desc = "Equalize all width and height" },
    { "<leader>sh", "<C-w>s", desc = "Split horizontally" },
    { "<leader>sm", ":MaximizerToggle<cr>", desc = "Maximize current window" },
    { "<leader>sv", "<C-w>v", desc = "Split vertically" },
    { "<leader>sx", ":close<cr>", desc = "Close current split window" },
})

wk.add({
    { "<leader>g", group = "Telescope Git" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>gf", "<cmd>Telescope git_bcommits<cr>", desc = "Git file commits for current file/buffer" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status per file with diff preview" },
})


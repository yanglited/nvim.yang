-- center the cursor to middle of screen when scrolling up and down:
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- in normal and visual modes, yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank to end of line, Y is equivalent to y$
vim.keymap.set("n", "<leader>p", [["+p]]) -- paste from system clipboard

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")


local wk = require("which-key")
wk.register({
  ["<leader>t"] = {
    name = "Tabs",
    o = { ":tabnew<cr>", "Open new tab" },
    x = { ":tabclose<cr>", "Close current tab" },
    n = { ":tabn<cr>", "Go to next tab" },
    p = { ":tabp<cr>", "Go to previous tab" },
  },
})

wk.register({
  ["<leader>s"] = {
    name = "Splits/window",
    v = { "<C-w>v", "Split vertically" },
    h = { "<C-w>s", "Split horizontally" },
    e = { "<C-w>=", "Equalize all width and height" },
    x = { ":close<cr>", "Close current split window" },
    m = { ":MaximizerToggle<cr>", "Maximize current window" },
  },
})

wk.register({
  ["<leader>g"] = {
    name = "Telescope Git",
    c = { "<cmd>Telescope git_commits<cr>",  "Git commits" },
    f = { "<cmd>Telescope git_bcommits<cr>", "Git file commits for current file/buffer" },
    b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    s = { "<cmd>Telescope git_status<cr>",   "Git status per file with diff preview" },
  },
})


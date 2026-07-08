vim.g.mapleader = " "

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Buffers read from stdin (e.g. `cmd | nvim -`) have nothing to save; let :q work
autocmd("StdinReadPost", {
  pattern = "*",
  callback = function()
    vim.bo.modified = false
  end,
})

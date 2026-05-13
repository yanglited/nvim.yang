return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = false,
	},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{
			"<leader>o",
			function()
				if vim.bo.filetype == "NvimTree" then
					local target
					for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].filetype ~= "NvimTree" then
							target = win
							break
						end
					end
					if target then
						vim.api.nvim_set_current_win(target)
					else
						vim.cmd("vsplit")
					end
				end
				vim.cmd("Oil")
			end,
			desc = "Open Oil",
		},
	},
}

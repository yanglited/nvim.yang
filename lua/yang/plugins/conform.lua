return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile", "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				sh = { "shellharden" },
				bash = { "shellharden" },
				cmake = { "cmake_format" },
				latex = { "latexindent" },
				tex = { "latexindent" },
			},
		})

		local wk = require("which-key")
		wk.add({
			{ "<leader>n", group = "Format" },
			{
				"<leader>nf",
				function()
					conform.format({ async = true, lsp_format = "fallback" })
				end,
				desc = "Format",
			},
		})
	end,
}

return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
                -- md is good for MarkdownPreview to render latex
                -- only default syntax is supporte for generating HTML: VimwikiAll2HTML
                -- Comment out next 3 lines to use default
                -- Consider to use a symlink: cd;ln -s ~/notes/master/vimwiki_md vimwiki_md
				path = "~/vimwiki_md", -- path = "~/vimwiki",
				syntax = "markdown",
				ext = ".md",
			},
		}
	end,
}

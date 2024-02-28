return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/documents/vimwiki",
				syntax = "markdown",
				ext = ".md",
			},
		}

		local keymap = vim.keymap
		keymap.set("n", "<C-Space>", "<Plug>VimwikiToggleListItem<Bar>j<Bar>/[A-Z]<CR>", { silent = true })
	end,
}

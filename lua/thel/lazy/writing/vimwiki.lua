return {
	"vimwiki/vimwiki",
	init = function()
		-- params wiki
		local wiki_default = {
			syntax = "markdown",
			ext = ".md",
			nested_syntaxes = {
				["c"] = "c",
				["rust"] = "rust",
				["python"] = "python",
				["lua"] = "lua",
				["js"] = "js",
				["bash"] = "bash",
				["c++"] = "cpp",
				["latex"] = "tex",
			},
		}

		-- notes
		local main_wiki = vim.deepcopy(wiki_default)
		main_wiki.name = "wiki"
		main_wiki.path = "~/wiki/"

		-- deez nutz
		-- local thel = vim.deepcopy(wiki_default)
		-- thel.name = "productivity"
		-- thel.path = "~/productivity/"

		vim.g.vimwiki_list = { main_wiki }
		vim.g.vimwiki_ext2syntax = {
			[".md"] = "markdown",
			[".markdown"] = "markdown",
			[".mdown"] = "markdown",
		}
		vim.g.vimwiki_filetypes = { "markdown" }
		-- vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki (0)
		-- vim.g.vimwiki_folding = "list"
		vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
		vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links

		local keymap = vim.keymap
		keymap.set("n", "<C-Space>", "<Plug>VimwikiToggleListItem<CR>0")
	end,
}

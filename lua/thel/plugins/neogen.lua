return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = {
		snippet_engine = "luasnip",
	},
	init = function()
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opts)
	end,
}

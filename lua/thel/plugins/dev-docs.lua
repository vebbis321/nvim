return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>df", "<cmd>DevdocsOpenCurrentFloat<cr>" },
	},
	opts = {
		dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
		wrap = true, -- text wrap, only applies to floating window
	},
}

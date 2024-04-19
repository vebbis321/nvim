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
		float_win = { -- passed to nvim_open_win(), see :h api-floatwin
			relative = "editor",
			height = 100,
			width = 150,
			border = "rounded",
		},
		wrap = true, -- text wrap, only applies to floating window
	},
}

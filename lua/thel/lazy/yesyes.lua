return {
	-- most plugins need this
	"nvim-lua/plenary.nvim",

	-- tmux nav
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		tmux_navigator_no_mappings = 1,
		keys = {
			{ "<m-h>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "<m-j>", "<cmd>TmuxNavigateDown<cr>" },
			{ "<m-k>", "<cmd>TmuxNavigateUp<cr>" },
			{ "<m-l>", "<cmd>TmuxNavigateRight<cr>" },
		},
	},

	-- colors to hex/rgb
	{ "NvChad/nvim-colorizer.lua", event = "BufReadPre" },
}

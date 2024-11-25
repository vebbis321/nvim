return {
	-- most plugins need this
	"nvim-lua/plenary.nvim",

	-- tmux nav
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<m-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<m-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<m-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<m-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
	},

	-- colors to hex/rgb
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = { -- set to setup table
	},
}

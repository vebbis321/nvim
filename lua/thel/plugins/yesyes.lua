return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"NvChad/nvim-colorizer.lua",
	{
		"opdavies/toggle-checkbox.nvim",
		config = function()
			local keymap = vim.keymap
			keymap.set("n", "<C-Space>", ":lua require('toggle-checkbox').toggle()<CR>j0")
		end,
	},
}

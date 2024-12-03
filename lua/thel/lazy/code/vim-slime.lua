return {
	"jam1015/vim-slime",
	init = function()
		-- these two should be set before the plugin loads
		vim.g.slime_target = "tmux"
		vim.g.slime_no_mappings = true
	end,
	config = function()
		vim.keymap.set("x", "<leader>s", "<Plug>SlimeRegionSend", { remap = true, silent = false })
		vim.keymap.set("n", "<leader>s", "<Plug>SlimeMotionSend", { remap = true, silent = false })
		vim.keymap.set("n", "<leader>ss", "<Plug>SlimeLineSend", { remap = true, silent = false })
	end,
}

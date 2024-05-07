return {
	"michaelb/sniprun",
	branch = "master",

	build = "sh install.sh",
	-- do 'sh install.sh 1' if you want to force compile locally
	-- (instead of fetching a binary from the github release). Requires Rust >= 1.65

	config = function()
		require("sniprun").setup({})

		local keymap = vim.keymap

		keymap.set("v", "sr", "<Plug>SnipRun", { silent = true })
		keymap.set("n", "<leader>sr", "<Plug>SnipRun", { silent = true })
	end,
}

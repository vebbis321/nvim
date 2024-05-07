return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	branch = "harpoon2",
	config = function()
		-- set keymaps
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<F1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<F2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<F3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<F4>", function()
			harpoon:list():select(4)
		end)
	end,
}

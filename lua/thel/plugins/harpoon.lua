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
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>y", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>u", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>i", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>o", function()
			harpoon:list():select(4)
		end)
	end,
}

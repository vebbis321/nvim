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

		vim.keymap.set("n", "<F5>", function()
			harpoon:list():select(5)
		end)

		vim.keymap.set("n", "<F6>", function()
			harpoon:list():select(6)
		end)

		vim.keymap.set("n", "<F7>", function()
			harpoon:list():select(7)
		end)

		vim.keymap.set("n", "<F8>", function()
			harpoon:list():select(8)
		end)
	end,
}

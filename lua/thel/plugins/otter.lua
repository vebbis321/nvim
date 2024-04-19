return {
	-- for lsp features in code cells / embedded code
	"jmbuhr/otter.nvim",
	dev = false,
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
	},
	opts = {
		buffers = {
			set_filetype = true,
		},
	},
	config = function()
		local otter = require("otter")

		otter.setup({
			set_filetype = true,
		})

		vim.g.markdown_fenced_languages = {
			"python",
			"javascript",
			"typescript",
			"bash=sh",
			"lua",
			"go",
			"rust",
			"c",
			"cpp",
		}

		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = { "*.md" },
			callback = function()
				otter.activate({ "python", "javascript", "typescript", "c", "cpp", "rust", "lua", "bash" }, true, true)
				vim.api.nvim_buf_set_keymap(0, "n", "gd", ":lua require'otter'.ask_definition()<cr>", { silent = true })
				vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua require'otter'.ask_hover()<cr>", { silent = true })
			end,
		})
	end,
}

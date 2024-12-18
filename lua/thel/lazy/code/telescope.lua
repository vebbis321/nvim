return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			pickers = {
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", ".DS_Store" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", ".DS_Store" },
					hidden = true,
				},
			},
			extensions = {
				"fzf",
			},
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy find files in git" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

		-- YESSSSS
		keymap.set("n", "<leader>fw", function()
			require("telescope.builtin").find_files({ cwd = "~/wiki/", prompt_title = "wiki" })
		end)

		keymap.set("n", "<leader>fr", function()
			require("telescope.builtin").find_files({ cwd = "~/repos/", prompt_title = "repos" })
		end)

		keymap.set("n", "<leader>fc", function()
			require("telescope.builtin").find_files({ cwd = "~/code/", prompt_title = "code" })
		end)
	end,
}

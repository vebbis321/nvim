return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				python = { "ruff_format", "ruff_orgaize_imports" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				-- markdown = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeouts_ms = 500,
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			notify_on_error = true,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeouts_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

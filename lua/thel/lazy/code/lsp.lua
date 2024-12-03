return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup()

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)

			keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end)

			keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)

			keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)

			keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)

			keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)

			keymap.set("n", "<leader>va", function()
				vim.lsp.buf.code_action()
			end, opts)

			keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			if client.name == "ruff_lsp" then
				-- Disable hover in favor of Pyright
				client.server_capabilities.hoverProvider = false
			end
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["clangd"].setup({
			on_attach = on_attach,
			capabilities = cmp_nvim_lsp.default_capabilities(),
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		lspconfig["ruff"].setup({
			on_attach = on_attach,
			init_options = {
				settings = {
					-- Any extra CLI arguments for `ruff` go here.
					args = {},
				},
			},
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						ignore = { "*" },
					},
				},
			},
		})

		lspconfig["ltex"].setup({
			filetypes = { "markdown", "md" },
			settings = {
				ltex = {
					language = "en",
				},
			},
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}

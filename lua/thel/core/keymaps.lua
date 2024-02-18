vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- back to netrw
keymap.set("n", "<leader>jf", vim.cmd.Ex)
-- Netrw stuff
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

		bind("<c-l>", ":TmuxNavigateRight<cr>")
	end,
})

-- jump to previous file
keymap.set("n", "<C-b>", "<C-^>")

-- let cursor stay in place after paste
keymap.set("n", "J", "mzJ`z")

-- let cursor stay in the middle when jumping half-pages
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- let cursor stay in the middle when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- move blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
-- save
keymap.set("n", "<c-w>", ":w<CR>") -- normal mode
keymap.set("i", "<c-w>", "<ESC>:w<CR>l") -- insert mode
keymap.set("v", "<c-w>", "<ESC>:w<CR>") -- normal mode

-- greatest remap ever
-- foo bar
keymap.set("x", "<leader>p", [["_dP]])

-- yank into buffer
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- delete to void register
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- nope
keymap.set("n", "Q", "<nop>")

-- switch projects
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- swift
keymap.set("n", "<leader>xb", ":!swift build<CR>")
keymap.set("n", "<leader>xr", ":!swift run<CR>")

-- lazy
keymap.set("n", "<leader>lz", ":Lazy<CR>")
-- mason
keymap.set("n", "<leader>ms", ":Mason<CR>")

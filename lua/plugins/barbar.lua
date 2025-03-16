return {
	"romgrk/barbar.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	priority = 90, -- Because of conflicts with nvim-tree.

	config = function()
		local bb = require "barbar"

		bb.setup {
			animation = false,
			focus_on_close = "previous",
			no_name_title = "New File",

			sidebar_filetypes = {
				NvimTree = true,
			}
		}

		-- Keybinds
		vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>")
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrev<CR>")
		vim.keymap.set("n", "<leader>w", "<cmd>BufferClose<CR>")
	end
}

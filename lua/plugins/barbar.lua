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

		local map = require "util".map

		-- Keybinds
		map("n", "<Tab>", "<cmd>BufferNext<CR>", "Buffer: Next")
		map("n", "<S-Tab>", "<cmd>BufferPrev<CR>", "Buffer: Previous")
		map("n", "<leader>w", "<cmd>BufferClose<CR>", "Buffer: Close")
	end
}

return {
	"nvim-tree/nvim-tree.lua",

	lazy = false,
	priority = 80, -- Because of conflicts with barbar.

	config = function()
		local nt = require "nvim-tree"
		local ntapi = require "nvim-tree.api"

		nt.setup {
			disable_netrw = true,

			filters = {
				dotfiles = true,
				git_ignored = true,
			},

			renderer = {
				root_folder_label = false,
			}
		}

		-- Set keybinds
		vim.keymap.set("n", "<leader>e", ntapi.tree.open)
		vim.keymap.set("n", "<leader>t", ntapi.tree.toggle)

		-- Auto open
		ntapi.tree.toggle {
			focus = false,
		}
	end,
}

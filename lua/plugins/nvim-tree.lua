return {
	"nvim-tree/nvim-tree.lua",

	priority = 80, -- Because of conflicts with barbar.

	config = function()
		local nt = require "nvim-tree"
		local ntapi = require "nvim-tree.api"

		nt.setup {
			disable_netrw = true,
			hijack_cursor = true,

			filters = {
				dotfiles = true,
				git_ignored = true,
			},

			renderer = {
				root_folder_label = false,
			}
		}

		local map = require "util".map

		-- Set keybinds
		map("n", "<leader>e", ntapi.tree.open, "nvim-tree: Open")
		map("n", "<leader>t", ntapi.tree.toggle, "nvim-tree: Toggle")

		-- Auto open & focus nvim-tree if we're not editing a single file.
		if next(vim.fn.argv()) == nil then
			ntapi.tree.toggle {
				focus = false,
			}
		end
	end,
}

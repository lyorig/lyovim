-- This file's name doesn't represent a specific plugin;
-- rather, it houses the current color scheme.

return {
	"catppuccin/nvim",

	priority = 100,

	config = function()
		local cat = require "catppuccin"

		cat.setup {
			flavour = "macchiato",
		}

		vim.cmd.colorscheme "catppuccin"
	end
}

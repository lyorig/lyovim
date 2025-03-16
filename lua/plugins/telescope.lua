return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local tele = require "telescope"
		local teleb = require "telescope.builtin"

		tele.setup {}

		vim.keymap.set("n", "<leader>fw", teleb.live_grep)
		vim.keymap.set("n", "<leader>ff", teleb.find_files)
	end
}

return {
	"navarasu/onedark.nvim",

	priority = 1000,

	config = function()
		local od = require "onedark";

		od.setup {
			style = "deep",

			toggle_style_key = "<leader>od",
			toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', },
		}

		od.load()
	end
}

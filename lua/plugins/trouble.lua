return {
	"folke/trouble.nvim",

	config = function()
		local tr = require "trouble"
		tr.setup {
			focus = true,

			open_no_results = true,
			warn_no_results = false,

			follow = false,

			win = {
				relative = "win",
			},
		}

		local map = require "util".map

		map("n", "<leader>D", function()
			tr.open({ mode = "diagnostics" })
		end, "Trouble: Open")

		map("n", "<leader>d", function()
			tr.toggle({ mode = "diagnostics", focus = false })
		end, "Trouble: Toggle");
	end
}

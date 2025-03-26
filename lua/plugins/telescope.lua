return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"olacin/telescope-gitmoji.nvim",
	},

	config = function()
		local tele = require "telescope"
		local tb = require "telescope.builtin"
		local ta = require "telescope.actions"

		tele.setup {
			defaults = {
				sorting_strategy = "ascending",
				initial_mode = "normal",

				layout_config = {
					prompt_position = "top",
				},

				mappings = {
					i = {
						["<Tab>"] = ta.move_selection_next,
						["<S-Tab>"] = ta.move_selection_previous,
					},

					n = {
						["<Tab>"] = ta.move_selection_next,
						["<S-Tab>"] = ta.move_selection_previous,
					},
				},
			},

			extensions = {
				gitmoji = {
					initial_mode = "insert",
				},
			},
		}

		tele.load_extension("gitmoji")

		local set = vim.keymap.set

		set("n", "<leader>fg", tb.live_grep)
		set("n", "<leader>ff", tb.find_files)
		set("n", "<leader>fr", tb.lsp_references)

		set("n", "<leader>fc", tb.git_commits)
		set("n", "<leader>fs", tb.git_status)

		set("n", "<leader>gm", tele.extensions.gitmoji.gitmoji)
	end
}

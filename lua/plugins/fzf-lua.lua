local function insert(func)
	return function()
		func({ initial_mode = "insert" })
	end
end

-- return {
-- 	"nvim-telescope/telescope.nvim",
--
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 	},
--
-- 	config = function()
-- 		local tele = require "telescope"
-- 		local tb = require "telescope.builtin"
--
--
-- 		tele.setup {
-- 			defaults = {
-- 				prompt_position = "top",
-- 				initial_mode = "normal",
-- 				sorting_stragegy = "ascending",
-- 			},
-- 		}
--
-- 		local set = vim.keymap.set
--
-- 		set("n", "<leader>fg", insert(tb.live_grep))
-- 		set("n", "<leader>ff", insert(tb.find_files))
-- 		set("n", "<leader>fr", tb.lsp_references)
--
-- 		set("n", "<leader>fc", tb.git_commits)
-- 		set("n", "<leader>fs", tb.git_status)
-- 	end
-- }

return {
	"ibhagwan/fzf-lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local fzf = require "fzf-lua"

		fzf.setup {

		}

		local set = vim.keymap.set

		set("n", "<leader>fg", fzf.live_grep)
		set("n", "<leader>ff", fzf.files)
		set("n", "<leader>fr", fzf.lsp_references)

		set("n", "<leader>fc", fzf.git_commits)
		set("n", "<leader>fs", fzf.git_status)
	end
}

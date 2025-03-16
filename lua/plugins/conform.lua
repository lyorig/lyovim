return {
	"stevearc/conform.nvim",

	opts = {
		format_on_save = function()
			if vim.bo.filetype ~= "java" then -- semestrálka
				return { timeout_ms = 500, lsp_format = "fallback" }
			end
		end,
	},
}

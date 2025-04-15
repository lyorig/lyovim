vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.wo.number = true
		vim.wo.signcolumn = "yes"
	end,
})

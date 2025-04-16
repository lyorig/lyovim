local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
	callback = function()
		vim.wo.number = true
		vim.wo.signcolumn = "yes"
	end,
})

local function get_win_name(winnr)
	return vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(winnr))
end

-- Auto-close nvim-tree
autocmd("BufEnter", {
	callback = function()
		local wins = vim.api.nvim_list_wins()

		if #wins == 1 and get_win_name(wins[1]):find("NvimTree_") ~= nil then
			vim.cmd("qa")
		end
	end
})

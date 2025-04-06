function Toggle()
	local cfg = vim.diagnostic.config().virtual_text
	vim.diagnostic.config { virtual_text = not cfg, virtual_lines = cfg }
end

vim.keymap.set("n", "<leader>vt", Toggle, {})

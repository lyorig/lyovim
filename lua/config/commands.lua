local map = require "util".map

map("n", "<leader>vt", function()
	local cfg = not not vim.diagnostic.config().virtual_text
	vim.diagnostic.config { virtual_text = not cfg, virtual_lines = cfg }
end, "LSP: Toggle virtual lines/text")

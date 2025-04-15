return {
	map = function(mode, cmd, action, desc)
		vim.keymap.set(mode, cmd, action, { desc = desc })
	end
}

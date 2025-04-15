return {
	---Shorthand for `vim.keymap.set` with remapping enabled and a description.
	---
	---@param mode string|string[] The mode(s) in which to enable this mapping.
	---@param cmd string The command which triggers `action`.
	---@param action string|function The action to take when `cmd` is inputted.
	---@param desc string The mapping description, useful for which-key.
	map = function(mode, cmd, action, desc)
		vim.keymap.set(mode, cmd, action, { desc = desc, remap = true })
	end
}

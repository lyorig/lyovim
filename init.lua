require "config.lazy"
require "config.mappings"
require "config.options"
require "config.commands"
require "config.autocmd"

if vim.g.neovide then
	require "config.neovide"
end

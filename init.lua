require "config.lazy"
require "config.mappings"
require "config.options"
require "config.commands"

if vim.g.neovide then
	require "config.neovide"
end

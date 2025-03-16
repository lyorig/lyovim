require "config.lazy"
require "config.mappings"
require "config.options"

if vim.g.neovide then
	require "config.neovide"
end

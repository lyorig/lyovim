return {
	"neovim/nvim-lspconfig",

	lazy = false,

	config = function()
		local lsp = require "lspconfig"

		lsp.clangd.setup {}

		lsp.rust_analyzer.setup {}

		lsp.phpactor.setup {}

		lsp.jdtls.setup {}

		lsp.lua_ls.setup {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name

					if path ~= vim.fn.stdpath("config") and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")) then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT"
					},

					workspace = {
						checkThirdParty = false,

						library = {
							vim.env.VIMRUNTIME
						}
					}
				})
			end,

			settings = {
				Lua = {
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,
}

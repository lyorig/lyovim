return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"saghen/blink.cmp",
	},

	opts = {
		servers = {
			clangd = {},
			rust_analyzer = {},
			phpactor = {
				root_dir = "/Users/lyorig/Documents/Programming/Moodle",
			},
			jdtls = {},
			lua_ls = {
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
			},
		},
	},

	config = function(_, opts)
		local lsp = require "lspconfig"
		local blink = require "blink.cmp"

		for server, config in pairs(opts.servers) do
			config.capabilities = blink.get_lsp_capabilities(config.capabilities)
			lsp[server].setup(config)
		end

		vim.diagnostic.config {
			virtual_lines = false,
			virtual_text = true,
		}

		vim.lsp.log.set_level(vim.log.levels.OFF);
	end,
}

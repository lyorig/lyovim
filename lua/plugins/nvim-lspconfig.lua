local function check_moodle_root_dir()
	local res = vim.fn.getcwd()
	local i, j = res:find("Moodle", 0, true);

	-- Not in Moodle or its subdirs.
	if i == nil then
		return
	end

	return res:sub(0, j)
end

return {
	"neovim/nvim-lspconfig",

	config = function(_, opts)
		local lsp = require "lspconfig"

		lsp.clangd.setup {}
		lsp.rust_analyzer.setup {}
		lsp.jdtls.setup {}

		lsp.phpactor.setup {
			root_dir = check_moodle_root_dir(),
		}

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

		vim.diagnostic.config {
			virtual_lines = false,
			virtual_text = true,

			update_in_insert = true,
		}

		vim.lsp.log.set_level(vim.log.levels.OFF);
		vim.lsp.enable("ts_ls")
	end,
}

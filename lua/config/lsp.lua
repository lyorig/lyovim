local lsp = require "lspconfig"

local caps = vim.lsp.protocol.make_client_capabilities()
caps = require "cmp_nvim_lsp".default_capabilities(caps)

-- C++
lsp.clangd.setup {
	capabilities = caps,
}

-- Rust
lsp.rust_analyzer.setup {
	capabilities = caps,
}

-- PHP
lsp.phpactor.setup {
	capabilities = caps,

	root_dir = vim.loop.cwd(),
}

-- Java
lsp.jdtls.setup {
	capabilities = caps,

	cmd = { "jdtls" },

	root_dir = vim.loop.cwd(),
}

-- Lua
lsp.lua_ls.setup {
	capabilities = caps,

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

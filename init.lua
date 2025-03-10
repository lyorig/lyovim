vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local _ = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{
		"andweeb/presence.nvim",
	},

	{
		"mfussenegger/nvim-jdtls",
	},
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

local lsp = require("lspconfig")

require("conform").setup({
	format_on_save = function()
		if vim.bo.filetype ~= "java" then -- semestrálka
			return { timeout_ms = 500, lsp_format = "fallback" }
		end
	end,
})

lsp.clangd.setup({})
lsp.rust_analyzer.setup({})
-- lsp.pyright.setup {}
lsp.phpactor.setup({
	root_dir = function(_)
		return vim.loop.cwd()
	end,
})

require("presence").setup({
	neovim_image_text = "At least it's not Electron.",
	main_image = "file",
	editing_text = "Committing war crimes in %s",
})

vim.diagnostic.config({ update_in_insert = true })

vim.schedule(function()
	require("mappings")
end)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "fm", vim.lsp.buf.format)

vim.g.rustfmt_autosave = 1

if vim.g.neovide then
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_scroll_animation_length = 0.00

	vim.o.guifont = "CodeNewRoman Nerd Font Mono:h16"
end

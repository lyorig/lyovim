vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  {
    "lukas-reineke/lsp-format.nvim"
  },

  {
		"andweeb/presence.nvim"
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

local lspfmt = require "lsp-format"
lspfmt.setup {}

local lsp = require "lspconfig"

lsp.clangd.setup {on_attach = lspfmt.on_attach}
lsp.rust_analyzer.setup {}
lsp.pyright.setup {on_attach = lspfmt.on_attach, update_in_insert = true}
lsp.html.setup {
	on_attach = lspfmt.on_attach
}
lsp.eslint.setup {}
lsp.phpactor.setup{}

require("presence").setup({
    neovim_image_text   = "At least it's not Electron.",
    main_image          = "file",
    editing_text        = "Creating bugs in %s"
})

vim.diagnostic.config {update_in_insert = true}

vim.schedule(function()
  require "mappings"
end)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>")

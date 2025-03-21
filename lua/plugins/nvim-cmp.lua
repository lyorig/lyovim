return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			opts = {},
		},

		{
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},

		{
			"L3MON4D3/LuaSnip",
			opts = {},
		},

		{
			"hrsh7th/cmp-path",
		},
	},

	config = function()
		local cmp = require "cmp"
		local luasnip = require "luasnip"

		cmp.setup {
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete {},
				["<CR>"] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },

				{ name = "luasnip" },

				{
					name = "path",

					option = {
						trailing_slash = true,
					},
				},
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		}
	end,
}

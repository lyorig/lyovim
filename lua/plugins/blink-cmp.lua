return {
	"saghen/blink.cmp",

	dependencies = {
		"L3MON4D3/LuaSnip",
		"xzbdmw/colorful-menu.nvim",
	},

	build = "cargo +nightly build --release",

	config = function()
		local cm = require "colorful-menu"

		require "blink-cmp".setup {
			keymap = {
				preset = "none",

				["<CR>"] = {
					"accept", "fallback"
				},

				["<Tab>"] = {
					"select_next", "fallback"
				},

				["<S-Tab>"] = {
					"select_prev", "fallback"
				},
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				keyword = {
					range = "full",
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
				},

				ghost_text = {
					enabled = true,
				},

				menu = {
					max_height = 20,

					draw = {
						-- We don't need label_description now because label and label_description are already
						-- combined together in label by colorful-menu.nvim.
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return cm.blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return cm.blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},

			snippets = {
				preset = "luasnip",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },

				providers = {
					path = {
						opts = {
							trailing_slash = true,
						},
					},
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},

			signature = {
				enabled = true,
			},
		}
	end,
}

return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "olacin/telescope-gitmoji.nvim",
    },

    config = function()
        local tele = require "telescope"
        local tb = require "telescope.builtin"
        local ta = require "telescope.actions"

        tele.setup {
            defaults = {
                sorting_strategy = "ascending",
                initial_mode = "normal",

                layout_config = {
                    prompt_position = "top",
                },

                mappings = {
                    i = {
                        ["<Tab>"] = ta.move_selection_next,
                        ["<S-Tab>"] = ta.move_selection_previous,
                    },

                    n = {
                        ["<Tab>"] = ta.move_selection_next,
                        ["<S-Tab>"] = ta.move_selection_previous,
                    },
                },
            },

            extensions = {
                gitmoji = {
                    initial_mode = "insert",
                },
            },

            pickers = {
                colorscheme = {
                    enable_preview = true,
                    ignore_builtins = true
                }
            }
        }

        tele.load_extension("gitmoji")

        local map = require "util".map

        map("n", "<leader>rg", tb.live_grep, "Telescope: ripgrep")
        map("n", "<leader>ff", tb.find_files, "Telescope: Files")
        map("n", "<leader>fr", tb.lsp_references, "Telescope: LSP references")
        map("n", "<leader>cs", tb.colorscheme, "Telescope: Colorschemes")

        map("n", "<leader>gc", tb.git_commits, "Telescope: Git commits")
        map("n", "<leader>gs", tb.git_status, "Telescope: Git status")

        map("n", "<leader>gm", tele.extensions.gitmoji.gitmoji, "Telescope: Gitmoji")
        map("n", "<leader>tr", tb.resume, "Telescope: Result last search");
    end
}

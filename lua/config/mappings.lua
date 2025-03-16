-- Mappings:
-- This file is for mappings that don't depend on a require().

local k = vim.keymap

-- LSP
k.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>")
k.set("n", "gd", vim.lsp.buf.definition)
k.set("n", "gD", vim.lsp.buf.declaration)
k.set("n", "ga", vim.lsp.buf.code_action)
k.set("n", "fm", vim.lsp.buf.format)

-- Comments
k.set("n", "<leader>/", "gcc");
k.set("v", "<leader>/", "gc");

-- Clear highlights on Esc
k.set("n", "<Esc>", "<cmd>noh<CR>");

-- Trouble
k.set("n", "<leader>ds", "<cmd>Trouble diagnostics toggle<CR>")

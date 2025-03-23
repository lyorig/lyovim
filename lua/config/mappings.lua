-- Mappings:
-- This file is for mappings that don't depend on a require.

local set = vim.keymap.set

-- LSP
set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>")
set("n", "gd", vim.lsp.buf.definition)
set("n", "gD", vim.lsp.buf.declaration)
set("n", "ga", vim.lsp.buf.code_action)
set("n", "<leader>r", vim.lsp.buf.rename)

-- Comments
set("n", "<leader>/", "gcc");
set("v", "<leader>/", "gc");

-- Clear highlights on Esc
set("n", "<Esc>", "<cmd>noh<CR>");

-- Diagnostic list
set("n", "<leader>ds", "<cmd>Trouble diagnostics toggle<CR>")

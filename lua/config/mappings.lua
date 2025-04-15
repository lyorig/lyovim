-- Mappings:
-- This file is for mappings that don't depend on a require.

function Set(type, keymap, action, what)
	vim.keymap.set(type, keymap, action, { desc = what, remap = true })
end

-- LSP
Set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", "LSP: clangd: Switch source/header")
Set("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
Set("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
Set("n", "ga", vim.lsp.buf.code_action, "LSP: Code actions")
Set("n", "<leader>r", vim.lsp.buf.rename, "LSP: Rename symbol")

-- Comments
Set("n", "<leader>/", "gcc", "Comment out line");
Set("v", "<leader>/", "gc", "Comment out selection");

-- Clear highlights on Esc
Set("n", "<Esc>", "<cmd>noh<CR>", "Clear highlights");

-- Diagnostic list
Set("n", "<leader>d", "<cmd>Trouble diagnostics toggle focus=false<CR>", "Trouble: Open");
Set("n", "<leader>D", "<cmd>Trouble diagnostics toggle<CR>", "Trouble: Open with focus")

-- Disable period key
Set("n", ".", "<Nop>", "[disabled]");

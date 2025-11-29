-- Mappings:
-- This file is for mappings that don't depend on a require.

local map = require "util".map

local function toggle_wrap()
	vim.wo.wrap = not vim.wo.wrap
end

-- LSP
map("n", "<leader>s", "<cmd>LspClangdSwitchSourceHeader<cr>", "LSP: clangd: Switch source/header")
map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
map("n", "ga", vim.lsp.buf.code_action, "LSP: Code actions")
map("n", "<leader>r", vim.lsp.buf.rename, "LSP: Rename symbol")

-- Comments
map("n", "<leader>/", "gcc", "Comment out line");
map("v", "<leader>/", "gc", "Comment out selection");

-- Clear highlights on Esc
map("n", "<Esc>", "<cmd>noh<CR>", "Clear highlights");

-- Disable period key
map("n", ".", "<Nop>", "[disabled]");

-- ^$ remaps
map({ "n", "v" }, "f", "^", "Same as ^")
map({ "n", "v" }, "F", "$", "Same as $")

map("n", "<C-a>", "ggVG", "Select all")
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", "Write")
map("n", "<leader>i", vim.show_pos, "Shorthand for :Inspect")
map("n", "<leader>n", toggle_wrap, "Toggle wrap")

-- Terminal
map("t", "<Esc>", "<C-\\><C-N>", "Exit terminal mode");

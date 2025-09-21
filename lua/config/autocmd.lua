local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
    callback = function()
        vim.wo.number = true
        vim.wo.signcolumn = "yes"
        vim.wo.wrap = false
    end,
})

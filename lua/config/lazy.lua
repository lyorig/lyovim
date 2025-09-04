local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- General

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- Clone lazy.nvim.
    local out = vim.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath })

    -- Error handling for when cloning fails.
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()

        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require "lazy".setup {
    spec = {
        import = "plugins"
    },

    -- Don't print a message every time the config gets touched.
    change_detection = {
        notify = false,
    },
}

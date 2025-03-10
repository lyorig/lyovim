local config = {
    cmd = {'jdtls'},
    root_dir = vim.loop.cwd()
}

require('jdtls').start_or_attach(config)

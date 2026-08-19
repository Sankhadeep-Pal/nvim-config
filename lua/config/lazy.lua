local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Tell lazy.nvim to automatically import all specs inside lua/plugins/
require("lazy").setup({
    spec = {
        {
            import = "plugins",
            notify = false,
        },
    },
    checker = { enabled = false },
    change_detection = {
        enabled = false,
    },
})

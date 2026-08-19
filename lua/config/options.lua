local opt = vim.opt

-- Line Numbers & UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "80,120"
opt.signcolumn = "yes"
opt.termguicolors = true
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- Tabs & Indentation (4-space standard)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- spelling
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Files & Undo
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")

-- Splits & Performance
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 1000
opt.timeoutlen = 500

vim.opt.mouse = "a"

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Wayland Clipboard Bridge
if vim.fn.executable("wl-copy") == 1 then
    vim.g.clipboard = {
        name = "wl-clipboard",
        copy = {
            ["+"] = "wl-copy",
            ["*"] = "wl-copy",
        },
        paste = {
            ["+"] = "wl-paste --no-newline",
            ["*"] = "wl-paste --no-newline",
        },
        cache_enabled = 0,
    }
end
opt.clipboard = "unnamedplus"

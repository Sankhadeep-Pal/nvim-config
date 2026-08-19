local keymap = vim.keymap.set

-- Fast Save / Quit / Esc
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>wq<CR>", { desc = "Save & Quit" })
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force Quit" })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlights" })

-- Split Management & Navigation
keymap("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split Vertical" })
keymap("n", "<leader>s", "<cmd>split<CR>", { desc = "Split Horizontal" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Buffer Navigation
keymap("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Visual Mode Indentation
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- In-file Search & Replace
keymap("n", "<leader>r", ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace on line" })
keymap("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace in file" })

-- Select whole file
keymap("n", "<C-a>", "ggVG$", { desc = "Select All" })

-- 1. Commenting: Bind both <C-/> and <C-_> with remap = true
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment current line" })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comment current line" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment selection" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Comment selection" })

-- 2. Spell Suggestions: Use terminal-friendly triggers (<leader>ss, <leader>s, or <C-s>)
-- Open inline completion list at cursor (doesn't take over full window)
vim.keymap.set("n", "<C-s>", function()
    require("which-key").show({ keys = "z=", loop = false })
end, { desc = "Spell Suggestions" })

-- (Optional) If your terminal emulator supports Kitty keyboard protocol / CSI u for <C-.>
vim.keymap.set("n", "<C-.>", "z=", { desc = "Spell suggestions" })

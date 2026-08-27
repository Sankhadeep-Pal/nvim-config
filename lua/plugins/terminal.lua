-- Helper function to determine the best directory
local function get_term_dir()
    local file_dir = vim.fn.expand("%:p:h")
    -- Search upward for a .git folder starting from the file's directory
    local git_dir = vim.fn.finddir(".git", file_dir .. ";")

    if git_dir ~= "" then
        -- Return the parent of the .git folder (the actual repository root)
        return vim.fn.fnamemodify(git_dir, ":h")
    end

    -- Fallback to the current file's directory
    return file_dir
end

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    keys = {
        -- Instead of static command strings, we use Lua functions to evaluate the dir dynamically
        {
            "<leader>t",
            function()
                vim.cmd("ToggleTerm direction=float dir=" .. get_term_dir())
            end,
            desc = "Toggle Terminal (Float)",
        },
        {
            "<C-\\>",
            function()
                vim.cmd("ToggleTerm direction=float dir=" .. get_term_dir())
            end,
            desc = "Toggle Terminal (Float)",
        },
        {
            "<leader>th",
            function()
                vim.cmd("ToggleTerm direction=horizontal size=15 dir=" .. get_term_dir())
            end,
            desc = "Terminal (Horizontal)",
        },
        {
            "<leader>tv",
            function()
                vim.cmd("ToggleTerm direction=vertical size=60 dir=" .. get_term_dir())
            end,
            desc = "Terminal (Vertical)",
        },
    },
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        auto_scroll = true,
        float_opts = {
            border = "curved",
            winblend = 0,
        },
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)

        -- Quick terminal navigation bindings
        function _G.set_terminal_keymaps()
            local opt = { buffer = 0 }
            vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<cr>", opt)
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opt)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opt)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opt)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opt)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opt)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opt)
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = function()
                set_terminal_keymaps()
            end,
        })
    end,
}

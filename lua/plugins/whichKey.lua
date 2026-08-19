return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 200,
        win = {
            border = "rounded",
            padding = { 1, 2 },
            title = true,
            title_pos = "center",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- Add your custom groups and keys here
        wk.add({
            { "<leader>c", group = "Code / LSP" },
            { "<leader>d", desc = "Show Line Diagnostics" },
            { "<leader>e", desc = "File Explorer (Oil)" },
            { "<leader>f", desc = "Format Buffer" },
            { "<leader>r", group = "Refactor / Rename" },
            { "<leader>t", group = "Terminal" },
            {
                "<C-s>",
                function()
                    wk.show({ keys = "z=", loop = false })
                end,
                desc = "Spell Suggestions",
            },
            { "<C-s>a", "zg", desc = "Add Word to Dictionary" },
            { "<C-s>w", "zw", desc = "Mark Word as Wrong" },
            { "<C-s>u", "zug", desc = "Undo Add Word" },
            { "<C-s>t", "<cmd>setlocal spell!<cr>", desc = "Toggle Spell Check" },
        })
    end,
}

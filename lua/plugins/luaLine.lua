return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "catppuccin/nvim",
        "echasnovski/mini.icons",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin-nvim",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                disabled_filetypes = { statusline = { "oil", "snacks_dashboard", "harpoon", "toggleterm" } },
            },
            sections = {
                lualine_a = { { "mode" } },
                lualine_b = {
                    { "branch" },
                    {
                        "diff",
                        symbols = { added = "+", modified = "~", removed = "-" },
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
                    },
                    { "lsp_status" },
                    { "filetype" },
                },
                lualine_y = {
                    { "searchcount" },
                    { "progress" },
                },
                lualine_z = {
                    { "selectioncount" },
                    { "location" },
                },
            },
        })
    end,
}

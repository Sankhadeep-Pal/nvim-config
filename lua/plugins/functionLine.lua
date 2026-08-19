return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = {
                enabled = true,
                show_start = false, -- Draw an underline / bracket at the function start
                show_end = false, -- Draw an underline / bracket at the function end
                show_exact_scope = true,
                injected_languages = true,
                highlight = { "Function", "Label" }, -- Uses your theme's highlight color for the active scope line
            },
        },
    },
}

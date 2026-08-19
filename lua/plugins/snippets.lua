return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local luasnip = require("luasnip")

        -- 1. Load community snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- 2. Load custom snippets from ~/.config/nvim/snippets/
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
        })

        -- Custom LuaSnip configuration
        luasnip.config.setup({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        -- Placeholder jumping keymaps
        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            end
        end, { silent = true, desc = "Jump to next snippet placeholder" })

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true, desc = "Jump to previous snippet placeholder" })
    end,
}

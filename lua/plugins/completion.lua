return {
    "saghen/blink.cmp",
    version = "*", -- Automatically downloads the pre-built Rust binary
    dependencies = {
        "L3MON4D3/LuaSnip", -- We keep this for your custom snippets
    },
    opts = {
        fuzzy = {
            -- "score" automatically calculates exact match, locality, and your usage history
            sorts = { "score", "sort_text" },
        },
        -- Tell blink to use your LuaSnip engine
        snippets = { preset = "luasnip" },

        -- 1:1 mapping translation from your nvim-cmp setup
        keymap = {
            preset = "none",
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        },

        appearance = {
            -- Blink natively supports Nerd Font icons
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },

        completion = {
            accept = {
                -- This entirely replaces your nvim-autopairs hook
                auto_brackets = { enabled = true },
            },
            menu = {
                border = "rounded",
                draw = {
                    -- Separate the core label from the dimmed details into columns
                    columns = {
                        { "kind_icon" }, -- Col 1
                        { "label" }, -- Col 2 (Modified to hide parameters)
                        { "label_detail", gap = 1 }, -- Col 3 (Parameters, Dimmed)
                    },
                    components = {
                        -- This is the crucial part: Force the main label to ONLY show the core name
                        label = {
                            text = function(ctx)
                                return ctx.label
                            end, -- Only use ctx.label, not label + detail
                            highlight = "CmpItemAbbr", -- Normal function name color
                        },
                        -- Dim the parameter list in the separate column
                        label_detail = {
                            text = function(ctx)
                                return ctx.label_detail
                            end,
                            highlight = "Comment", -- Use dimmed 'Comment' color for right column
                        },
                    },
                },
            },
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 200,
                window = { border = "rounded" },
            },
        },

        sources = {
            -- Blink handles the grouping and priority natively and async
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}

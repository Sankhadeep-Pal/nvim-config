return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- Auto-insert brackets on function confirm
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        cmp.setup({
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp.config.compare.recently_used, -- Puts recently selected items higher
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- Group & limit sources to prevent clutter
            sources = cmp.config.sources({
                { name = "nvim_lsp", max_item_count = 15, priority = 1000 },
                { name = "luasnip", max_item_count = 3, priority = 500 },
                { name = "path", max_item_count = 5, priority = 250 },
            }, {
                { name = "buffer", max_item_count = 5, priority = 100, keyword_length = 3 },
            }),

            formatting = {
                format = function(entry, vim_item)
                    -- Apply lspkind icons
                    vim_item = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 40,
                        ellipsis_char = "...",
                    })(entry, vim_item)

                    -- Source label tag
                    vim_item.menu = ({
                        -- path = "[Path]",
                        -- nvim_lsp = "[LSP]",
                        -- buffer = "[Buf]",
                        -- luasnip = "[Snip]",
                    })[entry.source.name]

                    -- Remove duplicate symbol clutter in label
                    vim_item.dup = ({
                        nvim_lsp = 0,
                        luasnip = 0,
                        buffer = 0,
                    })[entry.source.name] or 0

                    return vim_item
                end,
            },
        })
    end,
}

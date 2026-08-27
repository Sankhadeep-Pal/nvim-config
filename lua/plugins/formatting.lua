return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<C-f>",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            lua = { "stylua" },
            rust = { "rustfmt" },
            go = { "gofmt", "goimports" },
            javascript = { "prettier", stop_after_first = true },
            typescript = { "prettier", stop_after_first = true },
            javascriptreact = { "prettier", stop_after_first = true },
            typescriptreact = { "prettier", stop_after_first = true },
            html = { "prettier", stop_after_first = true },
            css = { "prettier", stop_after_first = true },
            json = { "prettier", stop_after_first = true },
            yaml = { "prettier", stop_after_first = true },
            markdown = { "prettier", stop_after_first = true },
            sql = { "sql_formatter" },
        },

        -- Global 4-space override parameters for each CLI formatter engine
        formatters = {
            ["clang-format"] = {
                prepend_args = {
                    "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                },
            },
            ["stylua"] = {
                prepend_args = {
                    "--indent-type",
                    "Spaces",
                    "--indent-width",
                    "4",
                },
            },
            ["prettier"] = {
                prepend_args = {
                    "--tab-width",
                    "4",
                    "--use-tabs",
                    "false",
                },
            },
            ["prettierd"] = {
                prepend_args = {
                    "--tab-width",
                    "4",
                    "--use-tabs",
                    "false",
                },
            },
            ["rustfmt"] = {
                prepend_args = {
                    "--config",
                    "tab_spaces=4,hard_tabs=false",
                },
            },
            ["sql_formatter"] = {
                prepend_args = {
                    "--config",
                    '{"tabWidth": 4, "useTabs": false}',
                },
            },
        },

        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },
    },
}

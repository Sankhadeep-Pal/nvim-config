return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            -- Enable Mason UI with clean rounded borders
            mason.setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            -- 1. Ensure LSP Servers are installed
            mason_lspconfig.setup({
                ensure_installed = {
                    "clangd",        -- C / C++
                    "rust_analyzer", -- Rust
                    "gopls",         -- Go
                    "ts_ls",         -- JS / TS / React
                    "html",          -- HTML / EJS
                    "cssls",         -- CSS
                    "sqlls",         -- SQL
                    "lua_ls",        -- Lua
                },
                automatic_installation = true,
            })

            -- 2. Ensure Formatters & External Tools are installed
            mason_tool_installer.setup({
                ensure_installed = {
                    "clang-format",  -- C / C++ formatter
                    "stylua",        -- Lua formatter
                    "prettier",      -- JS / TS / HTML / CSS / JSON / Markdown formatter
                    "sql-formatter", -- SQL formatter
                },
            })
        end,
    },
}

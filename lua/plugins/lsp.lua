return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Keymaps attached whenever an LSP connects to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
                end

                -- Navigation & Definitions
                map("gd", vim.lsp.buf.definition, "Go to Definition")
                map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                map("gr", vim.lsp.buf.references, "Find References")
                -- map("K", vim.lsp.buf.hover, "Hover Documentation")
                -- map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")

                -- Actions & Diagnostics
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                -- map("<leader>d", vim.diagnostic.open_float, "Show Line Diagnostics")
                map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
                -- NEW: Automatically show diagnostics on hover
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = ev.buf,
                    callback = function()
                        -- Get current line number (Neovim API uses 0-indexed lines)
                        local line = vim.api.nvim_win_get_cursor(0)[1] - 1

                        -- Check for any diagnostics (errors/warnings) on the current line
                        local diagnostics = vim.diagnostic.get(ev.buf, { lnum = line })

                        if #diagnostics > 0 then
                            -- If errors exist, show the diagnostic window
                            vim.diagnostic.open_float(nil, {
                                focusable = false,
                                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                                source = "always",
                                prefix = " ",
                                scope = "cursor",
                                border = "rounded",
                            })
                        else
                            -- No errors? Silently try to show documentation instead
                            if vim.bo[ev.buf].filetype ~= "lua" then
                                pcall(vim.lsp.buf.hover, { border = "rounded" })
                            end
                        end
                    end,
                })

                -- NEW: Automatically show signature help in Insert mode
                vim.api.nvim_create_autocmd("CursorHoldI", {
                    buffer = ev.buf,
                    callback = function()
                        pcall(vim.lsp.buf.signature_help, { border = "rounded" })
                    end,
                })
            end,
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        -- Server configurations
        local servers = {
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                    "--completion-style=detailed",
                },
            },
            rust_analyzer = {},
            gopls = {},
            ts_ls = {},
            html = {},
            cssls = {},
            sqlls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            },
        }

        for server, config in pairs(servers) do
            config.capabilities = capabilities

            if vim.lsp.config and vim.lsp.enable then
                -- Native Neovim 0.11+ API
                vim.lsp.config[server] = config
                vim.lsp.enable(server)
            else
                -- Fallback for Neovim 0.10 and older
                require("lspconfig")[server].setup(config)
            end
        end
    end,
}

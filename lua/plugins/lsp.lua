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
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")

                -- Actions & Diagnostics
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                map("<leader>d", vim.diagnostic.open_float, "Show Line Diagnostics")
                map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
            end,
        })

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

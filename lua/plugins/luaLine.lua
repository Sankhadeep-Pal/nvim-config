return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "catppuccin/nvim",
        "echasnovski/mini.icons",
    },
    config = function()
        local function active_lsp()
            local msg = "No LSP"
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if next(clients) == nil then
                return msg
            end
            local client_names = {}
            for _, client in ipairs(clients) do
                table.insert(client_names, client.name)
            end
            return table.concat(client_names, ", ")
        end

        require("lualine").setup({
            options = {
                theme = "catppuccin-nvim",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                disabled_filetypes = { statusline = { "oil", "snacks_dashboard" } },
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
                    -- Displays pending vim motions/keys (e.g. 'd', 'y', 'g', '<leader>')
                    {
                        function()
                            return vim.fn.showcmd()
                        end,
                        cond = function()
                            return vim.fn.has("nvim-0.9") == 1
                        end,
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
                    },
                    { active_lsp, icon = "⚙" },
                    { "filetype" },
                },
                lualine_y = { { "progress" } },
                lualine_z = { { "location" } },
            },
        })
    end,
}

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "echasnovski/mini.icons" },
    event = "VeryLazy",
    keys = {
        { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
        { "<leader>x", "<cmd>bdelete<cr>", desc = "Close Current Buffer" },
    },
    opts = {
        options = {
            mode = "buffers",
            separator_style = "thin",
            always_show_bufferline = false,

            -- Buffer Tab Close Icons
            show_buffer_close_icons = true,
            show_close_icon = true,
            close_icon = "✕ ",
            buffer_close_icon = "✕",
            modified_icon = "●",

            -- Mouse click actions
            close_command = "bdelete! %d", -- Click '✕' to close
            right_mouse_command = "bdelete! %d", -- Right-click tab to close
            left_mouse_command = "buffer %d", -- Left-click tab to switch

            diagnostics = { "nvim_lsp" },
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            offsets = {
                {
                    filetype = "oil",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                },
            },
            custom_areas = {
                right = function()
                    local result = {}
                    local seve = vim.diagnostic.severity
                    local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                    local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                    local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                    local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                    if error ~= 0 then
                        table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
                    end

                    if warning ~= 0 then
                        table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
                    end

                    if hint ~= 0 then
                        table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
                    end

                    if info ~= 0 then
                        table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
                    end
                    return result
                end,
            },
        },
    },
}

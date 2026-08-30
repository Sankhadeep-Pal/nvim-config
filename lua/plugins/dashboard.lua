return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
                -- { section = "startup" },
            },
            preset = {
                header = [[
███████╗  █████╗  ███╗   ██╗ ██╗  ██╗ ██╗  ██╗  ██████╗  ██╗
██╔════╝ ██╔══██╗ ████╗  ██║ ██║ ██╔╝ ██║  ██║ ██╔═══██╗ ██║
███████╗ ███████║ ██╔██╗ ██║ █████╔╝  ███████║ ██║   ██║ ██║
╚════██║ ██╔══██║ ██║╚██╗██║ ██╔═██╗  ██╔══██║ ██║   ██║ ╚═╝
███████║ ██║  ██║ ██║ ╚████║ ██║  ██╗ ██║  ██║ ╚██████╔╝ ██╗
╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝  ╚═════╝  ╚═╝
                ]],
                keys = {
                    { icon = "󰉋 ", key = "e", desc = "File Explorer", action = ":Oil" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = "󰞍 ",
                        key = "t",
                        desc = "Terminal",
                        action = function()
                            require("lazy").load({ plugins = { "toggleterm.nvim" } })
                            vim.cmd("ToggleTerm")
                        end,
                    },
                    -- { icon = "󱌢 ", key = "m", desc = "Mason Packages", action = ":Mason" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy Plugins", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Quit Neovim", action = ":qa" },
                },
            },
        },
    },
}

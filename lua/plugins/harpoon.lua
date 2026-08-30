return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED: setup must be called to initialize Harpoon
        harpoon:setup()

        -- Add current file to Harpoon
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon add file" })

        -- Toggle the Harpoon quick menu
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon menu" })

        -- Dynamic Keymap Generator
        local function refresh_harpoon_keymaps()
            for i = 1, 9 do
                local item = harpoon:list():get(i)
                -- Extract just the filename from the path, or default to "Empty"
                local filename = item and vim.fn.fnamemodify(item.value, ":t") or "Empty"

                vim.keymap.set("n", "<leader>h" .. i, function()
                    harpoon:list():select(i)
                    -- end, { desc = "Harpoon " .. i .. ": " .. filename })
                end, { desc = filename })
            end
        end

        -- 1. Run once on startup to set initial blank keymaps
        refresh_harpoon_keymaps()

        -- 2. Hook into Harpoon's internal event bus to overwrite the descriptions dynamically
        harpoon:extend({
            ADD = refresh_harpoon_keymaps,
            REMOVE = refresh_harpoon_keymaps,
            REORDER = refresh_harpoon_keymaps,
        })
    end,
}

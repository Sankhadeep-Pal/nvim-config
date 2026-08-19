return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 100,
    opts = {
        ensure_installed = {
            -- Systems & Core
            "c",
            "cpp",
            "rust",
            "go",
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "make",
            "cmake",

            -- Web Development
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "embedded_template",

            -- Data & Formats
            "sql",
            "json",
            "yaml",
            "markdown",
            "markdown_inline",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
    config = function(_, opts)
        local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end
        ts_configs.setup(opts)
    end,
}

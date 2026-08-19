-- Auto-save on idle and mode exit (triggers Conform format-on-save automatically)
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "InsertLeave", "FocusLost", "BufLeave" }, {
    group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
    pattern = "*",
    callback = function()
        if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.cmd("silent! write")
        end
    end,
})

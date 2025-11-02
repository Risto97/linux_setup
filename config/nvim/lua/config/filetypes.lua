vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.rdl",
    callback = function()
        vim.bo.syntax = "systemrdl"
        vim.bo.filetype = "systemrdl"
        vim.bo.commentstring = "// %s"
    end
})

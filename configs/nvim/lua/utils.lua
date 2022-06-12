local M = {}

function M.format_buffer()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if ft == 'python' then
        vim.cmd('Neoformat')
    else
        vim.lsp.buf.formatting()
    end
end

return M

local M = {}

function M.rename_file()
    local old_name = vim.fn.expand('%')
    if old_name == '' then
        print('No file name to rename')
        return
    end

    local new_name = vim.fn.input('New name: ', old_name, 'file')
    if new_name ~= '' and new_name ~= old_name then
        vim.cmd('saveas ' .. new_name)
        vim.cmd('silent! !rm ' .. vim.fn.shellescape(old_name))
        print('File renamed: ' .. old_name .. ' → ' .. new_name)
    end
end

function M.delete_file()
    local path = vim.fn.expand('%:p')
    if path == '' then
        vim.notify('No file to delete', vim.log.levels.WARN)
        return
    end

    local choice = vim.fn.confirm('Move file to local trash?\n' .. path, '&Yes\n&No', 2)
    if choice ~= 1 then
        vim.notify('Cancelled', vim.log.levels.INFO)
        return
    end

    -- Local trash folder (per Neovim data directory)
    local trash_dir = vim.fn.stdpath('data') .. '/trash/'
    vim.fn.mkdir(trash_dir, 'p')

    -- Get the filename and destination
    local filename = vim.fn.fnamemodify(path, ':t')
    local timestamp = os.date('%Y%m%d-%H%M%S-')
    local dest = trash_dir .. timestamp .. filename

    -- Move file
    local ok = os.rename(path, dest)
    if not ok then
        vim.notify('Failed to move file to local trash: ' .. path, vim.log.levels.ERROR)
        return
    end

    -- Close buffer
    local bufnr = vim.api.nvim_get_current_buf()
    pcall(vim.api.nvim_buf_delete, bufnr, { force = true })

    vim.notify('Moved to Trash: ' .. dest, vim.log.levels.INFO)
end

function M.telescope_live_grep_under_cursor()
    require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })
end

function M.telescope_live_grep_visual_selection()
    local saved_reg = vim.fn.getreg('z')
    vim.cmd('silent! normal! "zy')
    local selection = vim.fn.getreg('z')
    vim.fn.setreg('z', saved_reg)
    require('telescope.builtin').live_grep({ default_text = selection })
end

function M.toggle_virtual_text()
    local current_config = vim.diagnostic.config()
    local new_virtual_text = not current_config.virtual_text

    vim.diagnostic.config({
        virtual_text = new_virtual_text
    })

    if new_virtual_text then
        print("Virtual text: ON")
    else
        print("Virtual text: OFF")
    end
end

return M

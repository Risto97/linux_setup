
-- Format buffer
vim.api.nvim_set_keymap('n', ',f', "<cmd>lua require 'utils'.format_buffer()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>ww', "<cmd>lua require'nvim-window'.pick()<CR>", { noremap = true })

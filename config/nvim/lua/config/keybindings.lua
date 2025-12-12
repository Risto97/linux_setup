local helpers = require('helpers')

vim.keymap.set("n", "<Leader>ff", ":Telescope file_browser<CR>", { desc = 'File explorer' })
vim.keymap.set("n", "<Leader>fr", ":Telescope oldfiles<CR>", { desc = 'Browse recent files' })
vim.keymap.set("n", "<Leader>feR", ":source $MYVIMRC<CR>", { desc = 'Reload config' })
vim.keymap.set("n", "<Leader>fed", ":e $MYVIMRC<CR>", { desc = 'Edit config' })
vim.keymap.set("n", "<Leader>fs", ":w<CR>", { desc = 'Save file' })
vim.keymap.set("n", "<Leader>fF", ":Telescope find_files<CR>", { desc = 'Find files recursive' })
vim.keymap.set("n", "<Leader>fD", helpers.delete_file, { desc = 'Delete the current file' })
vim.keymap.set('n', '<Leader>fR', helpers.rename_file, { desc = 'Rename current file' })

vim.keymap.set('n', '<Leader>bp', ':BufSurfBack<CR>', { desc = 'Buffer previous' })
vim.keymap.set('n', '<Leader>bn', ':BufSurfForward<CR>', { desc = 'Buffer next' })
vim.keymap.set('n', '<Leader>bb', ':Telescope buffers<CR>', { desc = 'Browse buffers' })
vim.keymap.set('n', '<Leader>bd', ':bp<bar>sp<bar>bn<bar>bd<CR>',
    { desc = 'Close buffer, without disturbing the window layout' })
vim.keymap.set('n', '<Leader>bY', ':%y<CR>', { desc = 'Copy buffer' })
vim.keymap.set('n', '<Leader>bP', ':ggdG"0P<CR>', { desc = 'Replace buffer with clipboard' })

vim.keymap.set('n', '<Leader>qq', ":qa<CR>", { desc = 'Quit Neovim' })
vim.keymap.set('n', '<Leader>qQ', ":qa!<CR>", { desc = 'Force quit Neovim' })


vim.keymap.set('n', '<Leader>w/', ":vsp<CR>", { desc = 'Create split right' })
vim.keymap.set('n', '<Leader>w_', ":sp<CR>", { desc = 'Create split down' })
vim.keymap.set('n', '<Leader>wd', ":q<CR>", { desc = 'Close window' })
vim.keymap.set('n', '<Leader>w=', "<C-w>=", { desc = 'Equialize windows layout' })
vim.keymap.set('n', '<Leader>w<Down>', "<C-W><C-J>", { desc = 'Focus window down' })
vim.keymap.set('n', '<Leader>w<Up>', "<C-W><C-K>", { desc = 'Focus window up' })
vim.keymap.set('n', '<Leader>w<Left>', "<C-W><C-H>", { desc = 'Focus window left' })
vim.keymap.set('n', '<Leader>w<Right>', "<C-W><C-L>", { desc = 'Focus window right' })


vim.keymap.set('n', '<Leader>hpi', ":Lazy install<CR>", { desc = 'Install packages with lazy' })
vim.keymap.set('n', '<Leader>hpc', ":Lazy clean<CR>", { desc = 'Delete packages with lazy' })
vim.keymap.set('n', '<Leader>hpu', ":Lazy update<CR>", { desc = 'Update packages with lazy' })

vim.keymap.set('n', '<Leader>tn', ":set number!<CR>", { desc = 'Toggle line numbers' })

vim.keymap.set('v', '<Leader>lr', ":'<,'>!tac<CR>", { desc = 'Reverse lines in the visual selection' })

vim.keymap.set('n', '<Leader>gs', ":LazyGit<CR>", { desc = 'Open Lazygit' })

vim.keymap.set('n', '<Leader>sc', ":noh<CR>", { desc = 'Clear search highlight' })
vim.keymap.set('n', '<Leader>sp', helpers.telescope_live_grep_under_cursor, { desc = 'Live grep word under cursor' })
vim.keymap.set('x', '<Leader>sp', helpers.telescope_live_grep_visual_selection, { desc = 'Live grep visual selection' })


------------ LSP -------------

vim.keymap.set('n', '<leader>tt', helpers.toggle_virtual_text, { desc = "Toggle diagnostic virtual text" })

local lsp_opts = { noremap = true, silent = true }
vim.keymap.set('n', ',gD', vim.lsp.buf.declaration, lsp_opts, { desc = "Go to declaration" })
vim.keymap.set('n', ',gg', vim.lsp.buf.definition, lsp_opts, { desc = "Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, lsp_opts, { desc = "Display hover menu" })
vim.keymap.set('n', ',gi', vim.lsp.buf.implementation, lsp_opts, { desc = "Go to implementation" })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, lsp_opts, { desc = "Show signature help" })

-- Diagnostics
vim.keymap.set('n', ',dd', "<cmd>Telescope diagnostics<cr>", lsp_opts, { desc = "Open diagnostics" })

-- vim.keymap.set('n', ',D', vim.lsp.buf.type_definition, lsp_opts)
vim.keymap.set('n', ',rn', vim.lsp.buf.rename, lsp_opts, { desc = "Rename symbol" })
vim.keymap.set('n', ',ca', vim.lsp.buf.code_action, lsp_opts, { desc = "Show code actions" })
-- vim.keymap.set('n', ',gr', "<cmd>Trouble lsp_references<cr>", lsp_opts)
vim.keymap.set('n', ',=', vim.lsp.buf.format, { desc = "Format buffer" })
vim.api.nvim_set_keymap("n", ",ng", ":lua require('neogen').generate()<CR>", lsp_opts)


----------- Terminal mode ----------------------
vim.keymap.set('n', '<leader><CR>', ':sp<CR> :terminal<CR> :resize 10<CR> i', { desc = 'Open terminal at bottom' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


----------- Which key descriptions -------------
---
local wk = require("which-key")

wk.add({
    { "<leader>f",  group = "+file" },
    { "<leader>fe", group = "+config" },
    { "<leader>b",  group = "+buffers" },
    { "<leader>q",  group = "+quit" },
    { "<leader>w",  group = "+windows" },
    { "<leader>h",  group = "+system" },
    { "<leader>hp", group = "+packages" },
    { "<leader>s",  group = "+search" },
})

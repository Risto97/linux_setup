require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local fzflua = require('fzf-lua')
-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
	-- was needed for completion-nvim
	-- require'completion'.on_attach(client)
    -- Enable completion triggered by <c-x><c-o>
     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', ',gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', ',gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', ',gg', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', ',gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', ',wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', ',wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    -- Diagnostics
    vim.keymap.set('n', ',dd', "<cmd>Trouble document_diagnostics<cr>", bufopts)
    vim.keymap.set('n', ',dw', "<cmd>Trouble workspace_diagnostics<cr>", bufopts)

    vim.keymap.set('n', ',D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', ',rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', ',ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', ',gr', "<cmd>Trouble lsp_references<cr>", bufopts)
    vim.keymap.set('n', ',=', vim.lsp.buf.formatting, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {'jedi_language_server', 'pyright', 'clangd'}
local nvim_lsp = require("lspconfig")

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

end


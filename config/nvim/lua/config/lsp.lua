local capabilities = require('config.cmp').capabilities

-- Mason LSP auto-installation
require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = {
        "lua_ls",
        "neocmake",
        "clangd",
        "ruff",
        "pyright",
        "jedi_language_server"
    }
}

-- Simple on_attach function
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <C-x><C-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Lua LSP
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
        }
    }
})

-- Ruff LSP
vim.lsp.config("ruff", {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- Disable hover and signature help to avoid conflicts with pyright
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
})

-- Pyright LSP
vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pyright = {
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
})

vim.lsp.config("jedi_language_server", {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- clangd LSP
vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- neocmake LSP
vim.lsp.config("neocmake", {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Configure LSP diagnostics
vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = '●',
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})

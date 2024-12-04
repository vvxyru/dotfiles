return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({})
        mason_lspconfig.setup({
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
            automatic_installation = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }
                local map = vim.keymap.set

                map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                map('n', '<leader>mr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                map({ 'n', 'x' }, '<leader>mf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                map('n', '<leader>ma', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })
    end,
}

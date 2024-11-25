---@diagnostic disable: unused-local

return {
    "VonHeikemen/lsp-zero.nvim",
    event = "BufRead",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "neovim/nvim-lspconfig",            event = { "BufReadPre", "BufNewFile" }, },
        { "hrsh7th/cmp-nvim-lsp",             event = "InsertEnter" },
        { "hrsh7th/nvim-cmp",                 event = "InsertEnter" },
        { "hrsh7th/cmp-buffer",               event = "InsertEnter" },
        { "hrsh7th/cmp-cmdline",              event = "BufEnter" },
        { "L3MON4D3/LuaSnip",                 event = "InsertCharPre" },
    },

    config = function()
        local lsp_zero = require("lsp-zero")
        vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>")

        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            local map = vim.keymap.set

            -- map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "LSP Code Action" }, opts)
        end

        lsp_zero.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ["lua_ls"] = { "lua" },
            },
        })

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        })

        require("lspconfig").lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        local cmp = require("cmp")

        local cmp_action = lsp_zero.cmp_action()

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "neorg" },
                { name = "buffer" },
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback() -- Default behavior (e.g., inserting a tab character)
                    end
                end, { "i", "s" }),

                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback() -- Default behavior (e.g., inserting a tab character)
                    end
                end, { "i", "s" }),

                ["<cr>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true }) -- Confirm the current completion item
                    else
                        fallback()                     -- Default Enter behavior (e.g., inserting a newline)
                    end
                end, { "i", "s" }),
            }),

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            formatting = {
                format = require("nvim-highlight-colors").format
            }
        })
    end,
}

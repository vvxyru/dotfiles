return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- cmdline search setup
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- cmdline setup
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        }
                    },
                }),
        })

        require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- Tab to select the next item or fallback if not visible
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback() -- Default behavior (e.g., inserting a tab character)
                    end
                end, { "i", "s" }),

                -- Shift+Tab to select the previous item or fallback if not visible
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback() -- Default behavior (e.g., inserting a tab character)
                    end
                end, { "i", "s" }),

                ["<tab>"] = cmp.mapping.confirm({ select = true }),

            }),
            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),

        })
    end,
}


local themes = {
    "kanagawa",
    "kanagawa-paper",
    "posterpole",
}

return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                commentStyle = { italic = true },
                functionStyle = { italic = true },
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                transparent = true,
                dimInactive = false,
                terminalColors = true,
                background = {
                    dark = "dragon",
                    light = "lotus"
                },
            })
        end,
    },

    {
        "sho-87/kanagawa-paper.nvim",
        priority = 1000,
        config = function()
            require("kanagawa-paper").setup({
                transparent = true,
                dimInactive = false,
                terminalColors = true,
                commentStyle = { italic = true },
                functionStyle = { italic = true },
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                colors = { theme = {}, palette = {} },
            })
        end,
    },

    {
        "ilof2/posterpole.nvim",
        priority = 1000,
        config = function()
            require("posterpole").setup({
                transparent = true,
                selected_tab_highlight = true,
            })
        end,
    },

    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            local map = vim.keymap.set
            map("n", "<leader>pT", "<cmd>Themery<cr>")

            require("themery").setup({
                themes = themes,
                livePreview = true,
            })
        end,
    },
}

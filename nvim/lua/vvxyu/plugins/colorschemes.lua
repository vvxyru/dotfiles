local themes = {
    "kanagawa-paper",
}

return {
    {
        "sho-87/kanagawa-paper.nvim",
        lazy = true,
        event = "VimEnter",
        priority = 1000,
        config = function()
            require("kanagawa-paper").setup({
                -- transparent = true,
                transparent = false,
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

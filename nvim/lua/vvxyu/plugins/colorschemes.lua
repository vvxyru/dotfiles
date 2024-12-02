return {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa-paper").setup({
            transparent = true,
            terminalColors = true,
        })
        vim.cmd("colorscheme kanagawa-paper")
    end
}

return {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa-paper").setup({
            transparent = false,
            terminalColors = true,
        })
    end
}

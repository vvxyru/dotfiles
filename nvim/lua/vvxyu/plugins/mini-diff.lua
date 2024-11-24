return {
    "echasnovski/mini.diff",
    config = function()
        vim.keymap.set("n", "<leader>gd", "<cmd>lua require('mini.diff').toggle_overlay()<cr>")
        require("mini.diff").setup({
            view = {
                signs = { add = "+", change = "~", delete = "-" },
                style = "sign",
            }
        })
    end
}

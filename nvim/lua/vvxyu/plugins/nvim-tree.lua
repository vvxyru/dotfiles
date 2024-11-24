return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            filters = {
                dotfiles = true,
            }
        })
    end
}

return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n", "<leader>pf", "<cmd>FzfLua files<cr>", { desc = "Search files (fzf)" })
        require("fzf-lua").setup({})
    end
}

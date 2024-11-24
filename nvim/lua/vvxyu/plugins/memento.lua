return {
    'gaborvecsei/memento.nvim',
    lazy = true,
    event = "BufEnter",
    config = function()
        vim.keymap.set("n", "<leader>mm", require("memento").toggle)
        vim.keymap.set("n", "<leader>mc", require("memento").clear_history)
        require("memento").setup()
    end
}

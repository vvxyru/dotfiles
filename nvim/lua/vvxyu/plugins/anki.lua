return {
    "rareitems/anki.nvim",
    ft = anki,
    config = function()
        vim.keymap.set("n", "<leader>an", "<cmd>AnkiSend<cr>", { desc = "Send Anki Card" })
        vim.keymap.set("n", "<leader>ab", "<cmd>Anki basic<cr>", { desc = "Make Anki Basic Card" })
        require("anki").setup({
            tex_support = true,
        })
    end
}

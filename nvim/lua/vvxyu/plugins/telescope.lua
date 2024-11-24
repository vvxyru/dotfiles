return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local map = vim.keymap.set
        map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Find Files (Telescope)" })
    end
}

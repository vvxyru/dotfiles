return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        { "<leader>rp", "<cmd>lua require('harpoon.mark').add_file()<cr>" },
        { "<leader>rr", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" },
        { "<leader>rn", "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
        { "<leader>rp", "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
        { "<leader>rj", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" },
        { "<leader>rk", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>" },
        { "<leader>rl", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>" },
        { "<leader>r;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>" },
    },
}

return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
        { "<leader>rp", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>rs", function() require("persistence").select() end,              desc = "Select Session" },
        { "<leader>rd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
}

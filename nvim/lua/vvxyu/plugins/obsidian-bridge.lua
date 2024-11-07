return {
    "oflisback/obsidian-bridge.nvim",
    lazy = true,
    event = {
        "BufReadPre *.md",
        "BufNewFile *.md",
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" }
    },
    config = function() require("obsidian-bridge").setup() end,
}

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    event = {
        "BufReadPre /home/vvxyu/docs/drainbank/*.md",
        "BufNewFile /home/vvxyu/docs/drainbank/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/docs/drainbank",
            },
        },
    },
}

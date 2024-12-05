return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "lua",
                "rust",
                "bash",
                "markdown",
                "markdown_inline"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end
}

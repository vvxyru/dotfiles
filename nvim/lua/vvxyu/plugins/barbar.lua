return {
    "romgrk/barbar.nvim",
    lazy = true,
    event = "BufEnter",
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function()
        vim.g.barbar_auto_setup = false
        require("barbar").setup({
            animated = false,
            auto_hide = 0,
            tabpages = true,
            clickable = true,
            icons = {
                preset = "default",
                filetype = {
                    enabled = true,
                }
            },
            sidebar_filetypes = {
                NvimTree = true,
            },
        })
    end,

}

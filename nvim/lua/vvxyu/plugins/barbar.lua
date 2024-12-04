return {
    "romgrk/barbar.nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        vim.g.barbar_auto_setup = false
        require("barbar").setup({
            animated = false,
            tabpages = true,
            clickable = true,
            icons = {
                preset = "default",
                filetype = {
                    enabled = true,
                }
            },
            sidebar_filetypes = {
            },
        })
    end,
}

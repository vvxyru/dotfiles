return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            extensions = {
                "lazy",
                "mason",
                "toggleterm",
                "fugitive",
                "fzf",
            },
            sections = {
                lualine_x = {
                    "encoding",
                    "fileformat",
                    function()
                        local codeium_status = vim.fn["codeium#GetStatusString"]()
                        return codeium_status or ""
                    end,
                },
            },
        })
    end,
}

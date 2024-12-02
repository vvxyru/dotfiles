return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "BufEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Path to colorscheme file
        local colorscheme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"

        -- Function to get the saved colorscheme
        local function get_saved_colorscheme()
            local file = io.open(colorscheme_file, "r")
            if file then
                local colorscheme = file:read("*all"):match("^%s*(.-)%s*$")
                file:close()
                return colorscheme
            end
            return nil
        end

        -- Get the saved colorscheme
        local saved_colorscheme = get_saved_colorscheme() or "default"

        require("lualine").setup({
            options = {
                theme = saved_colorscheme,
                icons_enabled = true,
            },
        })
    end,

}

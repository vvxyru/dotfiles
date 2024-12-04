return {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local colorscheme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"

        -- Save selected colorscheme
        local function save_colorscheme(colorscheme)
            local file = io.open(colorscheme_file, "w")
            if file then
                file:write(colorscheme)
                file:close()
                print("Colorscheme saved: " .. colorscheme)
            else
                print("Error saving colorscheme!")
            end
        end

        require("telescope").setup({
            pickers = {
                colorscheme = {
                    enable_preview = true,
                    attach_mappings = function(_, map)
                        map("i", "<CR>", function(prompt_bufnr)
                            local action_state = require("telescope.actions.state")
                            local colorscheme = action_state.get_selected_entry().value
                            require("telescope.actions").close(prompt_bufnr)
                            vim.cmd("colorscheme " .. colorscheme)
                            save_colorscheme(colorscheme)
                        end)
                        return true
                    end,
                },
            },
        })

        -- Load colorscheme on startup
        local function load_colorscheme()
            local file = io.open(colorscheme_file, "r")
            if file then
                local colorscheme = file:read("*all"):match("^%s*(.-)%s*$")
                file:close()
                if colorscheme and colorscheme ~= "" then
                    vim.cmd("colorscheme " .. colorscheme)
                end
            end
        end

        load_colorscheme()
    end,
}

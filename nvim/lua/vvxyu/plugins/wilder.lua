return {
    "gelguy/wilder.nvim",
    event = "BufEnter",
    config = function()
        local wilder = require("wilder")
        require("wilder").setup({
            modes = { ":", "/", "?" },
        })

        wilder.set_option('renderer', wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
                highlights = {
                    border = "Normal",
                },
                border = "rounded",
            })
        ))

        wilder.set_option('renderer', wilder.popupmenu_renderer({
            highlighter = wilder.basic_highlighter(),
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() },
        }))

    end
}

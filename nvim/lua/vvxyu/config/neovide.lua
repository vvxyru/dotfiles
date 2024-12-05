local o = vim.o
local g = vim.g

if vim.g.neovide then
    o.guifont = "JetBrainsMono Nerd Font:h10"
    g.neovide_transparency = 0.75

    g.neovide_scroll_animation_length = 0.15

    g.neovide_padding_top = 2
    g.neovide_padding_bottom = 2
    g.neovide_padding_left = 2
    g.neovide_padding_right = 2

    g.neovide_hide_mouse_when_typing = true

    g.neovide_theme = "auto"
    g.neovide_refresh_rate = 144

    g.neovide_cursor_animation_length = 0.01
    g.neovide_cursor_anti_aliasing = false
    g.neovide_cursor_animate_in_insert_mode = true
    g.neovide_cursor_animate_command_line = false
    g.neovide_cursor_smooth_blink = true
    g.neovide_cursor_vfx_mode = "ripple"
end

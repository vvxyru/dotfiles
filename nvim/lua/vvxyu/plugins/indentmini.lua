return {
    "nvimdev/indentmini.nvim",
    event = "BufEnter",
    config = function()
        vim.cmd.highlight('IndentLine guifg=#464646')
        vim.cmd.highlight('IndentLineCurrent guifg=#54546D')
        require("indentmini").setup()
    end
}

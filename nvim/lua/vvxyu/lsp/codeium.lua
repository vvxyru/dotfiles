return {
    "Exafunction/codeium.vim",
    event = "BufEnter",

    config = function()
        vim.g.codeium_disable_bindings = 1
        vim.keymap.set("i", "<C-y>", function()
            return vim.fn["codeium#Accept"]()
        end, { noremap = true, expr = true, silent = true })

        vim.keymap.set("i", "<C-n>", function()
            return vim.fn["codeium#CycleCompletions"](1)
        end, { noremap = true, expr = true, silent = true })

        vim.keymap.set("i", "<C-p>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { noremap = true, expr = true, silent = true })

        vim.keymap.set("i", "<c-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { noremap = true, expr = true, silent = true })
    end,
}

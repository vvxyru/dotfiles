local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

local map = vim.keymap.set

map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Open Lazy (Plugin Manager)" })

require("lazy").setup({
    spec = {
        { import = "vvxyu.plugins" },
        { import = "vvxyu.lsp" },
    },
    change_detection = {
        notify = false
    },
})

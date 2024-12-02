-- Lazy bootstrap
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })
end
vim.opt.rtp:prepend(lazy_path)

local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Open Lazy (Plugin Manager)" })

-- Lazy setup
require("lazy").setup({
    spec = "vvxyu.plugins",
    change_detection = { notify = false },
})

-- Config file load
local config_dir = vim.fn.stdpath("config") .. "/lua/vvxyu/config"
for _, file in ipairs(vim.fn.readdir(config_dir)) do
    if file:match("%.lua$") and file ~= "lazy.lua" then
        require("vvxyu.config." .. file:gsub("%.lua$", ""))
    end
end


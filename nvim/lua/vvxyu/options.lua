local opt = vim.opt
local g = vim.g

opt.cursorline = true
opt.number = true

opt.wrap = false

opt.signcolumn = "auto"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

opt.scrolloff = 7

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.completeopt = "menu,menuone,noselect"

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

opt.updatetime = 150

-- Number on InsertEnter, RelativeNumber on InsertLeave
local function relativeLine()
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        pattern = "*",
        callback = function()
            opt.relativenumber = false
            opt.number = true
        end,
    })
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        pattern = "*",
        callback = function()
            opt.relativenumber = true
            opt.number = true
        end,
    })
end

relativeLine()

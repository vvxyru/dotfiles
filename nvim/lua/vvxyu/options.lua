local opt = vim.opt
local g = vim.g

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.cursorline = true
opt.relativenumber = true

opt.wrap = false

opt.signcolumn = "auto"
opt.numberwidth = 2

opt.showmode = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.shortmess:append "sI"

opt.backspace = "indent,eol,start"

opt.termguicolors = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.spell = true
opt.spelllang = { 'en_us' }

opt.scrolloff = 7

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

opt.laststatus = 2

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

opt.updatetime = 150

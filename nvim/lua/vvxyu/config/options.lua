local opt = vim.opt
local g = vim.g

opt.mouse = 'a'

opt.clipboard = 'unnamedplus'

-- Close netrw buffer after entering file
g.netrw_fastbrowse = 0

-- Startup
opt.shortmess:append "sI"

-- Tab
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smarttab = true
opt.scrolloff = 7
opt.sidescrolloff = 7
opt.signcolumn = "auto"
opt.showmode = false

-- Editor
opt.autowrite = true

-- UI
opt.termguicolors = true
opt.relativenumber = true
opt.laststatus = 3
opt.wrap = false
opt.cursorline = true

vim.cmd.highlight("IndentLine guifg=#464646")
vim.cmd.highlight("IndentLineCurrent guifg=#54546D")

-- Backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Performance
opt.lazyredraw = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

-- Command Line
opt.completeopt = 'menuone,noinsert,noselect'
opt.pumheight = 10

opt.timeoutlen = 500

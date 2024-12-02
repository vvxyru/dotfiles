local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- goatttttt
map("i", "jj", "<esc>", opts)
map("n", "<leader>pv", "<cmd>Ex<cr>", opts)

-- Line Movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map({ "n", "x" }, "H", "^", opts)
map({ "n", "x" }, "L", "$", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Insert Mode
map("i", "<C-BS>", "<C-w>", opts)

-- Clipboard
map("x", "<leader>pd", [["_dP]])
map("n", "<leader>ya", "<cmd>%y+<cr>")
map({"n", "v"}, "<leader>d", [["_d]])

-- Indenting
map("v", "<S-tab>", "<gv", opts)
map("v", "<tab>", ">gv", opts)

-- Search Binds
map("n", "<leader><cr>", "<cmd>nohl<cr>", { desc = "Clear Search Highlights" })

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Window Movement
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Window Resize
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Buffers
map("n", "<leader><tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader><S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "Delete Other Buffers" })

-- File Mappings
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save Current File" })
map("n", "<leader>W", "<cmd>wa!<cr>", { desc = "Save all Buffers" })

map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Current File" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force Quit all Files" })

map("n", "<leader>so", "<cmd>so<cr>", { desc = "Source Current File" })

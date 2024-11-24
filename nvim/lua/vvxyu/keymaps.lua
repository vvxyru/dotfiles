vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Goats
map("n", "<leader>pv", "<cmd>Ex<cr>", { noremap = true, silent = true, desc = "Open file explorer" })
map("i", "jj", "<esc>", opts)

-- Cursor movement
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })

-- Line indenting
map("v", "<tab>", ">gv", opts)
map("v", "<S-tab>", "<gv", opts)

map("n", "<tab>", ">>", opts)
map("n", "<S-tab>", "<<", opts)

map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- Cursor centering
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Search
map("n", "<leader><cr>", "<cmd>nohl<cr>", { noremap = true, silent = true, desc = "Clear search highlight" })

-- Copy and paste mappings
map("n", "<leader>ya", "<cmd>%y+<cr>", { noremap = true, silent = true, desc = "Copy entire file to clipboard" })

map("x", "<leader>pd", [["_dP]], { noremap = true, silent = true, desc = "Paste to void" })
map({ "n", "v" }, "<leader>d", [["_d]], { noremap = true, silent = true, desc = "Delete to void" })

-- Window movement/creation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>nv", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" })
map("n", "<leader>ns", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })

-- File mappings
map("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save current file" })
map("n", "<leader>W", "<cmd>wa!<cr>", { noremap = true, silent = true, desc = "Save all files" })
map("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true, desc = "Quit current file" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { noremap = true, silent = true, desc = "Force quit current file" })

map("n", "<leader>so", "<cmd>so<cr>", { noremap = true, silent = false, desc = "Source current file" })
map("n", "<leader>of", "<C-o>", opts)

-- Spelling
map("n", "zp", "z=", opts)

-- Telescope
local map = vim.keymap.set

map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy Find Files (Telescope)" })
map("n", "<leader>pT", "<cmd>Telescope colorscheme<cr>", { desc = "Pick Colorscheme (Telescope)" })

-- NvimTree
map("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Neotree" })

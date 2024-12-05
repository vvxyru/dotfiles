local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

local group = augroup("autocmds", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
    end,
})

-- Number on InsertEnter, RelativeNumber on InsertLeave
autocmd({ "InsertEnter" }, {
    pattern = "*",
    callback = function()
        opt.relativenumber = false
        opt.number = true
    end,
})
autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        opt.relativenumber = true
        opt.number = true
    end,
})

-- Don't auto-comment new lines
autocmd("BufEnter", {
    group = group,
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

-- Go to the last cursor position when opening a buffer
autocmd("BufReadPost", {
    group = group,
    callback = function()
        local mark = vim.fn.line("'\"")
        if mark > 0 and mark <= vim.fn.line("$") then
            vim.cmd("normal! g`\"")
        end
    end,
})

-- Wrap in text filetypes
autocmd("FileType", {
    group = group,
    pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- Spellcheck on filetype
local spell_types = { "text", "plaintex", "typst", "gitcommit", "markdown" }

vim.api.nvim_create_augroup("Spellcheck", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck", -- Grouping the command for easier management
  pattern = spell_types, -- Only apply to these file types
  callback = function()
    vim.opt_local.spell = true -- Enable spellcheck for these file types
  end,
  desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
    group = group,
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Apply indentline highlights on colorscheme switch
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.cmd.highlight("IndentLine guifg=#464646")
        vim.cmd.highlight("IndentLineCurrent guifg=#54546D")
    end,
})

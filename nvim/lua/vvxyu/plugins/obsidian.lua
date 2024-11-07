return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local function toggle_conceal()
            ---@diagnostic disable-next-line: undefined-field
            if vim.opt.conceallevel:get() == 2 then
                vim.opt.conceallevel = 0
            else
                vim.opt.conceallevel = 2
            end
        end

        vim.keymap.set("n", "<leader>eo", toggle_conceal)

        vim.opt.conceallevel = 2

        require("obsidian").setup({
            workspaces = {
                {
                    name = "notes",
                    path = "/home/vvxyu/docs/notes",
                },
            },
            completion = {
                nvim_cmp = true,
            },
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true },
                },
            },
            new_notes_location = "/home/vvxyu/docs/notes/root",
        })
    end,
}

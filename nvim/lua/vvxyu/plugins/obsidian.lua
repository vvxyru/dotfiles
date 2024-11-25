return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
        "BufReadPre /home/vvxyu/docs/notes/*.md",
        "BufNewFile /home/vvxyu/docs/notes/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local map = vim.keymap.set

        local function toggle_conceal()
            ---@diagnostic disable-next-line: undefined-field
            if vim.opt.conceallevel:get() == 2 then
                vim.opt.conceallevel = 0
            else
                vim.opt.conceallevel = 2
            end
        end

        map("n", "<leader>eo", toggle_conceal)

        vim.opt.conceallevel = 2

        require("obsidian").setup({
            workspaces = {
                {
                    name = "notes",
                    path = "~/docs/notes",
                    overrides = {
                        notes_subdir = "root"
                    },
                },
            },
            completion = {
                nvim_cmp = true,
            },

            new_notes_location = "notes_subdir",

            ---@param title string|?
            ---@return string
            note_id_func = function(title)
                local suffix = ""
                if title ~= nil then
                    suffix = title
                else
                    for _ = 1, 4 do
                        suffix = suffix
                    end
                end
                return suffix
            end,

            ---@return table
            note_frontmatter_func = function(note)
                if note.title then
                    note:add_alias(note.title)
                end

                local out = { id = note.id, aliases = note.aliases, tags = note.tags }

                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
        })
    end
}

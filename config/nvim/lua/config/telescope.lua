local fb_actions = require "telescope".extensions.file_browser.actions
local ts_actions = require("telescope.actions")
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

require("telescope").setup {
    defaults = {
        mappings = {
            ["i"] = {
                ["<Right>"] = ts_actions.select_default,
                ["<Esc>"] = ts_actions.close,
            },
            ["n"] = {
                -- your custom normal mode mappings
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            hidden = { file_browser = true, folder_browser = true },
            dir_icon = "",
            grouped = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                    ["<Left>"] = fb_actions.goto_parent_dir,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
    pickers = {
        oldfiles = {
            theme = "ivy",
            path_display = { "filename_first" },
        },
        diagnostics = {
            theme = "ivy",
        },
    }
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

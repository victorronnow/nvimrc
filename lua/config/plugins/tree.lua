return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>fe",
            function()
                require("neo-tree.command").execute({ toggle = true, position='float', popup_border_style='rounded', hide_dotfiles = false})
            end,
            desc = "Explorer NeoTree (root dir)",
        },
        {
            "<leader>be",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true, position = 'float', popup_border_style='rounded', hide_dotfiles = false })
            end,
            desc = "Buffer explorer",
        },
    },
    opts = {
            popup_border_style = "rounded",
            position = 'float',
            hide_dotfiles = false,
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            }
    },
}

return{ -- plugins with no-configuration
    "christoomey/vim-tmux-navigator",
    {
        "numTostr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
}

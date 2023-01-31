return {
    {   -- neovim 中的目录树
        "nvim-tree/nvim-tree.lua",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        config = function()
            -- load the colorscheme here
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            
            require("nvim-tree").setup()
        end,

        dependencies = {
            "nvim-tree/nvim-web-devicons",  -- 文档树图标
        }
    },
}

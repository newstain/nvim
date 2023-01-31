return {
    {   -- 状态栏
        'nvim-lualine/lualine.nvim',
        config = function()
            require("lualine").setup({
                -- add any options here
            })
        end,
        lazy = false,
        priority = 1000,
        dependencies = {
            'nvim-tree/nvim-web-devicons',  -- 图标
            lazy = true
        },
    }
}

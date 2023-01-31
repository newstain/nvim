return{ -- 文件检索
    {
        "nvim-telescope/telescope.nvim",

        version = "0.1.1",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local builtin = require("telescope.builtin")

            -- 进入telescope页面会是插入模式，回到正常模式就可以用j和k
            -- 环境里要安装ripgrep来移动了
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    }
}

return{ -- 用 git 标注文件中的修改内容
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup{
                signs = {
                    add          = { text = '+' },
                    change       = { text = '│' },
                    delete       = { text = '-' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
            }
        end
    }
}

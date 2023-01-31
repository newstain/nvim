return{
    "p00f/nvim-ts-rainbow", -- 颜色区分括号，配合 nvim-treesitter
    {   -- 语法高亮
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup{
                ensure_installed = {
                    "c",
                    "cpp",
                    "fortran",
                    "python",
                    "lua",
                    "latex"
                },

                highlight = {
                    enable = true,
                    disable = {"latex"},
                },

                indent = {
                    enable = true
                },

                rainbow = { -- nvim-ts-rainbow 配置
                    enable = true,
                    -- disable = { "jsx", "cpp" }, -- 对应的语言不加载
                    extended_mode = true, -- 高亮无括弧的定界符
                    max_file_lines = nil,
                },
            }
        end
    }
}

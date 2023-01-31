return{
    "akinsho/bufferline.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("bufferline").setup{
            options = {
                diagnostics = "nvim_lsp",   -- 使用nvim内置lsp

                offset = {{
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                }}
            }
        }
    end
}

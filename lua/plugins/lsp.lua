return{ -- lsp 服务
    "williamboman/mason.nvim",

    {   -- mason.nvim 和 nvim-lspconfig 间的桥梁
        "williamboman/mason-lspconfig.nvim",

        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                  }
              }
            })

            -- local servers = {
            --     clangd = {
            --         workspace = { checkThirdParty = true },
            --     },
            --     sumneko_lua = {
            --         workspace = { checkThirdParty = false },
            --     },
            -- }

            local mason_lspconfig = require "mason-lspconfig"
            mason_lspconfig.setup({
                -- 根据语言填写
                ensure_installed = {
                    "sumneko_lua",  -- lua
                    "clangd",       -- c and c++
                    "texlab",       -- latex, or install 'ltex'
                    "bashls",       -- bash
                    "fortls",       -- fortran
                },
                -- ensure_installed = vim.tbl_keys(servers),
            })

        end
    },

    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("lspconfig").sumneko_lua.setup({
                capabilities = capabilities,
            })

            require("lspconfig").texlab.setup({
                capabilities = capabilities,
            })

            require("lspconfig").clangd.setup({
                capabilities = capabilities,
            })

            require("lspconfig").bashls.setup({
                capabilities = capabilities,
            })

            require("lspconfig").fortls.setup({
                capabilities = capabilities,
            })
        end
    }
}

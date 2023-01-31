return{ -- 自动补全
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            -- nvim-cmp
            'rafamadriz/friendly-snippets',
        },

        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()

            -- 加载自定义片段
            require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/LuaSnip/"})
        end
    },

    {
        'hrsh7th/nvim-cmp',

        dependencies = {
            -- nvim-cmp
            'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
            'hrsh7th/cmp-buffer',   -- { name = 'buffer' },
            'hrsh7th/cmp-path',     -- { name = 'path' }
            'saadparwaiz1/cmp_luasnip',
        },

        config = function()

            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
              return
            end

            local snip_status_ok, luasnip = pcall(require, "luasnip")
            if not snip_status_ok then
              return
            end

            -- require("luasnip.loaders.from_vscode").lazy_load()

            local check_backspace = function()
                local col = vim.fn.col "." - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
            end

            cmp.setup {
                snippet = { -- 指定 snippet 插件
                    expand = function(args)
                        -- For `vsnip` users.
                        -- vim.fn["vsnip#anonymous"](args.body)

                        -- For `luasnip` users.
                        require('luasnip').lsp_expand(args.body)

                        -- For `ultisnips` users.
                        -- vim.fn["UltiSnips#Anon"](args.body)

                        -- For `snippy` users.
                        -- require'snippy'.expand_snippet(args.body)
                    end,
                },
                --
                -- 来源
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        -- For vsnip users.
                        -- { name = 'vsnip' },
                        -- For luasnip users.
                        { name = 'luasnip' },
                        --For ultisnips users.
                        -- { name = 'ultisnips' },
                        -- -- For snippy users.
                        -- { name = 'snippy' },
                    },
                    {
                        { name = 'buffer' },
                        { name = 'path' }
                    }
                ),

                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    -- ['<C-p>'] = cmp.mapping.select_prev_item(),  -- 上一个
                    -- ['<C-n>'] = cmp.mapping.select_next_item(),  -- 下一个
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expandable() then
                                luasnip.expand()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif check_backspace() then
                                fallback()
                            else
                                fallback()
                            end
                        end,
                            {
                                "i",
                                "s",
                            }
                    ),

                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                        {
                            "i",
                            "s",
                        }),
                }),
            }
        end
    },

}

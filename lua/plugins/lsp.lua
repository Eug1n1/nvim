return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lsp_servers = {
                "pyright",
                "ansiblels",
                "docker_compose_language_service"
            }

            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemas = {
                            ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
                        },
                    },
                }
            })

            lspconfig.lua_ls.setup({
                tools = {
                    inlay_hints = {
                        auto = false,
                    }
                },
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    })
                end,
                settings = {
                    Lua = {}
                },
                capabilities = capabilities
            })

            for _, lsp in ipairs(lsp_servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end
        end,
    }
}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "biome" },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        -- this is the "custom handler" for `lua-ls`
        -- fix undefined global vim
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end,
    }
}

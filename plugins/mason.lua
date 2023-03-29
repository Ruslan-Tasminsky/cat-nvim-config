-- customize mason plugins
return {
    -- use mason-lspconfig to configure LSP installations
    {
        "williamboman/mason-lspconfig.nvim",
        -- overrides `require("mason-lspconfig").setup(...)`
        opts = {
            ensure_installed = {
                "lua_ls", "emmet_ls", "cssls", "jsonls", "tsserver", "html",
                "marksman"
            }
        }
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        -- overrides `require("mason-null-ls").setup(...)`
        opts = {
            ensure_installed = {
                "prettier", "stylua", "fixjson", "luaformatter", "erb-lint",
                "eslint_d", "gitlint", "jsonlint", "luacheck", "markdownlint"
            }
        }
    }, {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = {ensure_installed = {"chrome"}}
    }
}

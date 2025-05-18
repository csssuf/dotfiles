return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "ms-jpq/coq_nvim", branch = "coq" },
        },
        init = function()
            vim.g.coq_settings = {
                auto_start = true,
            }
        end,
        config = function()
            vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("pyright")

            vim.keymap.set('n', '<Leader>n', function() vim.diagnostic.jump({count = 1}) end)
            vim.keymap.set('n', '<Leader>p', function() vim.diagnostic.jump({count = -1}) end)
        end,
    },
}

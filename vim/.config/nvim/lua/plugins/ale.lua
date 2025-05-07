return {
    {
        "dense-analysis/ale",
        config = function()
            vim.g.ale_linters = {
                rust = { 'rls' },
            }
        end,
        event = "VeryLazy",
    }
}

return {
    {
        "tpope/vim-vividchalk",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme vividchalk]])
        end,
    },
}


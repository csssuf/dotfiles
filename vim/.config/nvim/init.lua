require("config.lazy")

-- Base settings
vim.opt.compatible = false
vim.opt.termguicolors = true
vim.opt.modeline = true

-- Display/formatting
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = { 81, 101 }
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.foldmethod = 'syntax'

-- Misc.
vim.opt.undodir = vim.fs.normalize('~/.vim/undo')
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.wildmenu = true
vim.opt.title = true
vim.opt.showmatch = true -- Highlight matching parens, etc.
vim.opt.backspace = { 'indent', 'start', 'eol' }
vim.opt.wrap = false
vim.opt.shiftround = true

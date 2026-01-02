local vim = vim
local opt = vim.opt
local map = vim.keymap.set

require("config.lazy")

-- Use syntax highlighting and color scheme
opt.termguicolors = true
vim.cmd.colorscheme("zenburn")

-- ensure copy to clipboard works
opt.mouse = ""

-- wrtie file on make
opt.autowrite = true

opt.wrap = false
opt.number = true
opt.wildmenu = true
opt.wildmode = "list:longest"

-- Highlight current line
opt.cursorline = true

-- Turn of swap files and backups
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- Tabs are four spaces
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- Habit Breaking
map({ "n", "v", "i" }, "<Up>", "<NOP>", { noremap = true })
map({ "n", "v", "i" }, "<Down>", "<NOP>", { noremap = true })
map({ "n", "v", "i" }, "<Left>", "<NOP>", { noremap = true })
map({ "n", "v", "i" }, "<Right>", "<NOP>", { noremap = true })

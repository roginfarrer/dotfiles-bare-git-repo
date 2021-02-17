local vim = vim
local vimp = require "vimp"

vim.g["test#javascript#runner"] = "jest"
vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vert"

vimp.nmap("t<C-n>", [[:TestNearest<CR>]])
vimp.nmap("t<C-f>", [[:TestFile<CR>]])
vimp.nmap("t<C-s>", [[:TestSuite<CR>]])
vimp.nmap("t<C-l>", [[:TestLast<CR>]])
vimp.nmap("t<C-g>", [[:TestVisit<CR>]])

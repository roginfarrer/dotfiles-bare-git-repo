local vimp = require "vimp"

vimp.nmap("<C-c>", '"+y')
vimp.nnoremap("<Leader>y", '"+y')
vimp.xnoremap("<Leader>y", '"+y')
vimp.nnoremap("<Leader>p", '"+p')
vimp.xnoremap("<Leader>p", '"+p')
vimp.nnoremap("<Leader>P", '"+P')
vimp.xnoremap("<Leader>P", '"+P')

-- Make Y behave like it should
vimp.nmap("Y", "y$")

-- Whening changing, don't save to register
vimp.nnoremap("c", '"_c')
vimp.vnoremap("c", '"_c')

vimp.nmap("<C-j>", "<C-W>j")
vimp.nmap("<C-k>", "<C-W>k")
vimp.nmap("<C-h>", "<C-W>h")
vimp.nmap("<C-l>", "<C-W>l")

vimp.nmap("<leader>w", [[:w!<CR>]])
vimp.nmap("<leader>q", [[:q<CR>]])
vimp.nmap("<leader>x", [[:wq<CR>]])

-- newline without insert
vimp.nmap("<CR>", 'o<Esc>"_cc<Esc>')

-- If you like long lines with line wrapping enabled, this solves the problem that pressing down jumpes your cursor “over” the current line to the next line. It changes behaviour so that it jumps to the next row in the editor (much more natural)
vimp.nnoremap("j", "gj")
vimp.nnoremap("k", "gk")

vimp.nmap("0", "^")

vimp.nnoremap("<A-k>", [[:m .-2<CR>==]])
vimp.nnoremap("<A-j>", [[:m .+1<CR>==]])
vimp.vnoremap("<A-j>", [[:m '>+1<CR>gv=gv]])
vimp.vnoremap("<A-k>", [[:m '<-2<CR>gv=gv]])

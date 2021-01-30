local vimp = require "vimp"

vimp.nnoremap({"silent"}, "<C-t>", [[:FloatermToggle<CR>]])
vimp.tnoremap({"silent"}, "<C-t>", [[<C-\><C-n>:FloatermToggle<CR>]])

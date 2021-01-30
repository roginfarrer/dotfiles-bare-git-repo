local vimp = require "vimp"

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t "<C-n>" or _G.check_back_space() and t "<Tab>" or vim.call("coc#refresh()")
end
function _G.check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")) and true
end

vim.g.coc_node_path = "~/.fnm/aliases/latest/bin/node"

vim.g.coc_global_extensions = {
  "coc-tsserver",
  "coc-css",
  "coc-emmet",
  "coc-html",
  "coc-json",
  "coc-yaml",
  "coc-snippets",
  "coc-styled-components",
  "coc-tabnine",
  "coc-lua",
  "coc-vimlsp",
  "coc-vimlsp"
}

vimp.nmap({"silent"}, "gd", "<Plug>(coc-definition)")
vimp.nmap({"silent"}, "gt", "<Plug>(coc-type-definition)")
vimp.nmap({"silent"}, "gi", "<Plug>(coc-implementation)")
vimp.nmap({"silent"}, "gr", "<Plug>(coc-references)")
vimp.nmap({"silent"}, "<leader>do", "<Plug>(coc-codeaction)")

vimp.inoremap({"silent", "expr"}, "<Tab>", "v:lua.smart_tab()")
vimp.inoremap({"silent", "expr"}, "<c-space>", [[:call coc#refresh()]])

vimp.nmap({"silent"}, "[g", "<Plug>(coc-diagnostic-prev)")
vimp.nmap({"silent"}, "]g", "<Plug>(coc-diagnostic-next)")

vimp.nnoremap({"silent"}, "K", [[:call CocAction('doHover')]])
vimp.nmap("<leader>es", [[:CocCommand snippets.editSnippets<CR>]])

vimp.nnoremap(
  {"silent", "nowait", "expr"},
  "<C-f>",
  function()
    return vim.cmd("coc#float#has_scroll()") and vim.cmd("coc#float#scroll(1)") or t "<C-f>"
  end
)
vimp.nnoremap(
  {"silent", "nowait", "expr"},
  "<C-b>",
  function()
    return vim.cmd("coc#float#has_scroll()") and vim.cmd("coc#float#scroll(0)") or t "<C-b>"
  end
)
vimp.inoremap(
  {"silent", "nowait", "expr"},
  "<C-f>",
  function()
    return vim.cmd("coc#float#has_scroll()") and [[\<c-r>=coc#float#scroll(1)\<cr>]] or t "<Right>"
  end
)
vimp.inoremap(
  {"silent", "nowait", "expr"},
  "<C-b>",
  function()
    return vim.cmd("coc#float#has_scroll()") and [[\<c-r>=coc#float#scroll(0)\<cr>]] or t "<Left>"
  end
)
vimp.vnoremap(
  {"silent", "nowait", "expr"},
  "<C-f>",
  function()
    return vim.cmd("coc#float#has_scroll()") and vim.cmd("coc#float#scroll(1)") or t "<C-f>"
  end
)
vimp.vnoremap(
  {"silent", "nowait", "expr"},
  "<C-b>",
  function()
    return vim.cmd("coc#float#has_scroll()") and vim.cmd("coc#float#scroll(0)") or t "<C-b>"
  end
)

require("autocmds").autocmd("BufWritePre", "*.mdx", ":CocCommand prettier.formatFile")

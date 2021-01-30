local vim = vim

local M = {}

function M.autocmd(event, triggers, operations)
  local cmd = string.format("autocmd %s %s %s", event, triggers, operations)
  vim.cmd(cmd)
end

-- Return to last edit position when opening files (You want this!)
M.autocmd("BufReadPost", "*", [[if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif]])

M.autocmd("InsertEnter", "*", "set cul")
M.autocmd("InsertLeave", "*", "set nocul")

M.autocmd("TextYankPost", "*", [[silent! lua vim.highlight.on_yank{higroup="Substitute", timeout=250}]])

M.autocmd("BufEnter,BufRead", "*.tsx", "set filetype=javascriptreact")

return M

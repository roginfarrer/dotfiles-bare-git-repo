local vim = vim
local lspconfig = require('lspconfig')

local M = {}
local function requestCompletionItemResolve(bufnr, item)
   vim.lsp.buf_request(bufnr, "completionItem/resolve", item, function(err, _, result)
     if err or not result then
       return
     end
     if result.additionalTextEdits then
       vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr)
     end
    end)
end
function M.on_complete_done()

  local bufnr = vim.api.nvim_get_current_buf()
  local completed_item_var = vim.v.completed_item
  if
   completed_item_var and
   completed_item_var.user_data and
   completed_item_var.user_data.nvim and
   completed_item_var.user_data.nvim.lsp and
   completed_item_var.user_data.nvim.lsp.completion_item
   then
     local item = completed_item_var.user_data.nvim.lsp.completion_item
     requestCompletionItemResolve(bufnr, item)
 end
 if
   completed_item_var and
   completed_item_var.user_data and
   completed_item_var.user_data and
   completed_item_var.user_data.lsp and
   completed_item_var.user_data.lsp.completion_item
  then
   local item = completed_item_var.user_data.lsp.completion_item
   requestCompletionItemResolve(bufnr, item)
  end
  -- vim.v.completed_item = nil
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})

local on_attach = function(client)
  -- require 'completion'.on_attach()
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  print("'" .. client.name .. "' language server started" )
end

local servers = {'vimls'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_attach = on_attach
  }
end

lspconfig.tsserver.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue"
  },
  on_attach = on_attach,
}

local eslint = {
  lintCommand = "eslint_d --stdin --fix-to-stdout",
  lintIgnoreExitCode = true,
  lintStdin = true
}

lspconfig.efm.setup {
  on_attach = on_attach,
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {eslint},
      typescriptreact = {eslint},
      javascript = {eslint},
      javascriptreact = {eslint},
    }
  }
}

--- Deoplete
-- vim.g['deoplete#enable_at_startup'] = 1

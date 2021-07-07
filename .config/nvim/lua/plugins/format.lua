local prettier = function()
  return {
    -- exe = "node ~/repos/prettier_d_slim/lib/bin/prettier_d_slim.js",
    -- exe = "prettier_d_slim",
    -- args = {"--stdin", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    exa = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = true,
    filetype = {
      -- javascript = {prettier},
      -- javascriptreact = {prettier},
      -- typescript = {prettier},
      -- typescriptreact = {prettier},
      -- css = {prettier},
      -- markdown = {prettier},
      -- mdx = {prettier},
      -- scss = {prettier},
      -- html = {prettier},
      -- json = {prettier},
      -- yaml = {prettier},
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)
-- autocmd BufWritePost *.js,*.ts,*.tsx,*.md,*.mdx,*.css,*.scss,*.yaml,*.yml,*.json,*.jsx,*.lua FormatWrite

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua FormatWrite
augroup END
]], true)

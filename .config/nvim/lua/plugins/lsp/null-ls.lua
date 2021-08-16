local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
	-- b.formatting.prettier.with(
	--   {
	--     filetypes = {
	--       "javascript",
	--       "javascriptreact",
	--       "typescript",
	--       "typescriptreact",
	--       "css",
	--       "html",
	--       "json",
	--       "yaml",
	--       "markdown",
	--       "mdx"
	--     }
	--   }
	-- ),
	b.formatting.stylua,
}

local M = {}
M.setup = function(on_attach)
	null_ls.setup({
		-- debug = true,
		on_attach = on_attach,
		-- sources = sources
	})
end

return M

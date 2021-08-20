local settings = {
	Lua = {
		runtime = { version = 'LuaJIT' },
		diagnostics = {
			enable = true,
			globals = {
				'vim',
			},
		},
	},
}

local M = function(on_attach)
	return {
		on_attach = function(client, bufnr)
			on_attach(client)

			vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
		end,
		settings = settings,
	}
end

return M

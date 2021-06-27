local settings = {
	Lua = {
		runtime = { version = "LuaJIT" },
		diagnostics = {
			enable = true,
			globals = {
				"vim",
			},
		},
	},
}

local M = function(on_attach)
	return {
		on_attach = function(client, bufnr)
			on_attach(client)

			vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		end,
		-- cmd = { vim.fn.getenv("HOME") .. "/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server" },
		settings = settings,
	}
end

return M

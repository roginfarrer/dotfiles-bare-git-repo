require('lualine').setup({
	options = {
		theme = 'tokyonight',
		section_separators = { '', '' },
		-- component_separators = { '', '' },
		component_separators = { '', '' },
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'branch',
			'diff',
			{ 'diagnostics', sources = { 'nvim_lsp', 'coc' } },
		},
		lualine_c = { 'filename' },
		lualine_x = { 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
})

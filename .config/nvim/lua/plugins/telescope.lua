local actions = require'telescope.actions'
local builtin = require'telescope.builtin'

require('telescope').setup{
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    mappings = {
      -- insert mode
      i = {
        ["<esc>"] = actions.close
      },
      -- normal mode
      n = {
        ["<esc>"] = actions.close
      }
    }
  }
}

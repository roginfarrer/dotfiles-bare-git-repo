local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

require("telescope").setup {
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
    },
    generic_sorter = require "telescope.sorters".get_fzy_sorter,
    file_sorter = require "telescope.sorters".get_fzy_sorter,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    color_devicons = true,
    set_env = {["COLORTERM"] = "truecolor"}
  }
}
require("telescope").load_extension("fzy_native")
require('telescope').load_extension('fzf_writer')

local M = {}

function M.search_dotfiles()
  require("telescope.builtin").find_files {
    cwd = "~",
    find_command = {
      "git",
      "--git-dir",
      "/Users/rfarrer/.dotfiles/",
      "--work-tree",
      "/Users/rfarrer/",
      "ls-tree",
      "--full-tree",
      "-r",
      "--name-only",
      "HEAD"
    },
    prompt = "~ dotfiles ~"
  }
end

function M.search_config()
  require("telescope.builtin").find_files {
    shorten_path = true,
    cwd = "~/.config",
    prompt = "~ .config ~"
  }
end

function M.recent_buffers()
  builtin.buffers {
    sort_lastused = true,
    ignore_current_buffer = true,
    sorter = require "telescope.sorters".get_substr_matcher()
  }
end

return setmetatable(
  {},
  {
    __index = function(_, k)
      if M[k] then
        return M[k]
      else
        return builtin[k]
      end
    end
  }
)

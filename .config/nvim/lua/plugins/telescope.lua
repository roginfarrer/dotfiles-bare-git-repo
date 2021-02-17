local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local vimp = require "vimp"

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
    -- generic_sorter = require "telescope.sorters".get_fzy_sorter,
    -- file_sorter = require "telescope.sorters".get_fzy_sorter,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    color_devicons = true,
    set_env = {["COLORTERM"] = "truecolor"}
  }
}
-- require("telescope").load_extension("fzy_native")
require("telescope").load_extension("fzf_writer")

local M = {}

function M.search_dotfiles()
  builtin.git_files {
    cwd = "~/.local/share/chezmoi/",
    -- find_command = {
    --   "git",
    --   "--git-dir",
    --   "/Users/rfarrer/.dotfiles/",
    --   "--work-tree",
    --   "/Users/rfarrer/",
    --   "ls-tree",
    --   "--full-tree",
    --   "-r",
    --   "--name-only",
    --   "HEAD"
    -- },
    prompt = "~ dotfiles ~"
  }
end

function M.search_config()
  builtin.find_files {
    shorten_path = true,
    cwd = "~/.config",
    prompt = "~ .config ~"
  }
end

function M.recent_buffers()
  builtin.buffers {
    sort_lastused = true,
    -- ignore_current_buffer = true,
    sorter = require "telescope.sorters".get_substr_matcher()
  }
end

vimp.nnoremap({"silent"}, "<Leader>fp", [[<cmd>Telescope git_files<CR>]])
vimp.nnoremap({"silent"}, "<Leader>f.", [[<cmd>Telescope find_files<CR>]])
vimp.nnoremap({"silent"}, "<Leader>fg", [[<cmd>Telescope live_grep<CR>]])
vimp.nnoremap({"silent"}, "<leader>fb", M.recent_buffers)
vimp.nnoremap({"silent"}, "<leader>fd", M.search_dotfiles)
vimp.nnoremap({"silent"}, "<Leader>fh", [[<cmd>Telescope oldfiles<CR>]])

vimp.nnoremap({"silent"}, "<C-p>", [[<cmd>Telescope git_files<CR>]])
-- vimp.nnoremap({"silent"}, "<Leader>.", [[<cmd>Telescope find_files<CR>]])
vimp.nnoremap({"silent"}, "<leader>;", M.recent_buffers)
-- vimp.nnoremap({"silent"}, "<Leader>c", [[<cmd>Telescope command_history<CR>]])
-- vimp.nnoremap({"silent"}, "<Leader>h", [[<cmd>Telescope oldfiles<CR>]])
-- vimp.nnoremap({"silent"}, "<leader>d", M.search_dotfiles)

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

local u = require "utils"

local M = {}

M.gitlinker = function()
  local function copyToClipboard(mode)
    require "gitlinker".get_buf_range_url(mode, {action_callback = require "gitlinker.actions".copy_to_clipboard})
  end
  local function openInBrowser(mode)
    require "gitlinker".get_buf_range_url(mode, {action_callback = require "gitlinker.actions".open_in_browser})
  end

  u.nnoremap(
    "<leader>gc",
    function()
      copyToClipboard("n")
    end
  )
  u.vnoremap(
    "<leader>gc",
    function()
      copyToClipboard("v")
    end
  )

  u.nnoremap(
    "<leader>go",
    function()
      openInBrowser("n")
    end
  )
  u.vnoremap(
    "<leader>go",
    function()
      openInBrowser("v")
    end
  )
end

return M

local snap = require("snap")
local io = snap.get("common.io")

local function getKeysSortedByValue(tbl)
  local keys = {}
  for key in pairs(tbl) do
    table.insert(keys, key)
  end
  table.sort(
    keys,
    function(a, b)
      return tbl[a] > tbl[b]
    end
  )
  return keys
end

local defaults = {
  reverse = true
}

local function mergeDefaults(obj)
  for k, v in pairs(defaults) do
    obj[k] = v
  end
  return obj
end

local function file(obj)
  return snap.config.file(mergeDefaults(obj))
end

-- Runs ls and yields lua tables containing each line
local function getDotfiles(request)
  local cwd = snap.sync(vim.fn.getcwd)
  -- Iterates ls commands output using snap.io.spawn
  for data, err, kill in io.spawn(
    "git",
    {
      "--git-dir",
      "/Users/rfarrer/.dotfiles/",
      "ls-tree",
      "--full-tree",
      "-r",
      "--name-only",
      "HEAD"
    },
    cwd
  ) do
    -- If the filter updates while the command is still running
    -- then we kill the process and yield nil
    if request.canceled() then
      -- If there is an error we yield nil
      kill()
      coroutine.yield(nil)
    elseif err ~= "" then
      -- If the data is empty we yield an empty table
      coroutine.yield(nil)
    elseif data == "" then
      -- If there is data we split it by newline
      coroutine.yield({})
    else
      local splitLines = vim.split(data, "\n", true)
      for index, value in pairs(splitLines) do
        splitLines[index] = "/Users/rfarrer/" .. value
      end
      coroutine.yield(splitLines)
    end
  end
end

-- Taken from source
-- https://github.com/camspiers/snap/blob/4ed8f920f437138b7da38d5ad9003a1e2ca2ddb3/lua/snap/producer/vim/buffer.lua
local function get_buffers()
  local function _1_(_241)
    return vim.fn.bufname(_241)
  end
  local function _2_(_241)
    return ((vim.fn.bufname(_241) ~= "") and (vim.fn.buflisted(_241) == 1) and (vim.fn.bufexists(_241) == 1))
  end
  return vim.tbl_map(_1_, vim.tbl_filter(_2_, vim.api.nvim_list_bufs()))
end

-- Table of buffers
local snap_buffers = {}

function _G.push_buffer()
  local bufname = vim.fn.bufname("")
  -- push a key/value of buffer path and time entered
  snap_buffers[bufname] = vim.fn.reltimefloat(vim.fn.reltime())
end

function _G.delete_buffer()
  local bufname = vim.fn.bufname("")

  local function getIndex(tbl, key)
    local index = nil
    for i, k in ipairs(tbl) do
      if k == key then
        index = i
      end
    end
    return index
  end

  -- Remove path from table
  local idx = getIndex(snap_buffers, bufname)
  table.remove(snap_buffers, idx)
end

local function tableHasValue(tbl, val)
  for _, value in pairs(tbl) do
    if value == val then
      return true
    end
  end
  return false
end

local function makeBufferList()
  -- Get the active buffers that snap uses
  -- (this is a trimmed down list)
  local activeBuffers = get_buffers()
  -- Get our sorted list of buffers (with some we don't want)
  local filePathsSortedByTime = getKeysSortedByValue(snap_buffers)

  local result = {}
  for _, filepath in pairs(filePathsSortedByTime) do
    if (tableHasValue(activeBuffers, filepath)) then
      -- filter down our sorted list to the same items that Snap uses
      table.insert(result, filepath)
    end
  end

  -- Remove the active buffer
  table.remove(result, 1)

  return result
end

local function bufferProducer(request)
  -- Runs the slow-mode to get the buffers
  local result = snap.sync(makeBufferList)
  if request.canceled() then
    coroutine.yield(nil)
  else
    coroutine.yield(result)
  end
end

vim.cmd [[
  augroup snap_buffers
    autocmd!
    autocmd BufWinEnter,WinEnter * call v:lua.push_buffer()
    autocmd BufDelete * silent! call v:lua.delete_buffer()
  augroup END
]]

snap.maps(
  {
    {"<leader>fp", file({producer = "git.file"})},
    -- {"<leader>;", file({producer = "vim.buffer"})},
    {"<leader>;", file({prompt = "BUFFERS", producer = bufferProducer})},
    {"<Leader>fh", file({producer = "vim.oldfile"})},
    {"<leader>fg", snap.config.vimgrep(mergeDefaults({}))},
    {"<leader>f.", file({producer = "fd.file"})},
    {
      "<leader>fd",
      file(
        {
          prompt = "DOTFILES",
          producer = getDotfiles
        }
      )
    }
  }
)

-- The default character highlighting is incredibly distracting
-- this makes the highlighting a bit more reasonable
vim.cmd [[ execute('highlight! link SnapPosition Constant') ]]

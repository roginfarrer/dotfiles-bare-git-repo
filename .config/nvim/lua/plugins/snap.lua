local snap = require("snap")
local io = snap.get("common.io")

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

snap.maps(
  {
    {"<leader>fp", file({producer = "git.file"})},
    {"<leader>;", file({producer = "vim.buffer"})},
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

vim.cmd [[ execute('highlight! link SnapPosition Constant') ]]

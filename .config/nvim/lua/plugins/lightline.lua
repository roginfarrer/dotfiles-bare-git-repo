vim.g.lightline = {
  colorscheme = "lighthaus",
  active = {
    left = {
      {"mode", "paste"},
      {"readonly", "filename", "modified"}
    },
    right = {
      {"percent", "filetype"},
      {"gitbranch"}
    }
  },
  component_function = {
    gitbranch = "FugitiveHead"
  }
}

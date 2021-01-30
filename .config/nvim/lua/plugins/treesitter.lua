local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
  ensure_installed = "all",
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = {"md", "markdown"}
  }
}

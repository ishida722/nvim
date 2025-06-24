local markdown = require("plugins.markdown")
local lsp = require("plugins.lsp")
local ui = require("plugins.ui")
local filer = require("plugins.nvim-tree-setting")

require("lazy").setup(vim.tbl_flatten({
  markdown,
  lsp,
  ui,
  filer
}))



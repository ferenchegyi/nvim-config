-- init.lua

require("config.settings")
require("config.lazy")
require("config.colorscheme")
require("config.keybindings")
require("config.nvim-treesitter")
require("config.bufferline")
require("config.nvim-tree")
require("config.telescope")
require("config.diagnostic")

-- LSPs
vim.lsp.enable("luals")
vim.lsp.enable("typescriptls")
vim.lsp.enable("htmlls")
vim.lsp.enable("cssls")

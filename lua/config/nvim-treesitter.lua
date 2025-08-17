require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

require("nvim-treesitter").install({
  "rust", "javascript", "typescript", "tsx", "jsx", "lua",
  "css", "html", "scss", "json", "yaml", "toml",
  "sql", "markdown", "markdown_inline", "dockerfile", "bash", "vim"
})

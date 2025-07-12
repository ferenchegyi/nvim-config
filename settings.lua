-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General Settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.tabstop = 2               -- 2 spaces for tabs
vim.opt.shiftwidth = 2            -- 2 spaces for indent width
vim.opt.expandtab = true          -- Convert tabs to spaces
vim.opt.smartindent = true        -- Auto-indent new lines
vim.opt.wrap = true               -- Enable line wrapping
vim.opt.cursorline = true         -- Highlight the current line
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.mouse = 'a'               -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard with system
vim.opt.ignorecase = true         -- Case-insensitive searching
vim.opt.smartcase = true          -- Case-sensitive if uppercase is used
vim.opt.updatetime = 300          -- Faster completion (default is 4000ms)

-- Keybindings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>w', ':w<CR>') -- Save file
map('n', '<leader>q', ':q<CR>') -- Quit
map('n', '<S-h>', ':bprevious<CR>') -- Previous buffer
map('n', '<S-l>', ':bnext<CR>') -- Next buffer
map('n', '<leader>h', ':nohlsearch<CR>') -- Clear search highlights

-- Disable arrow keys in normal mode
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')

-- NvimTree binds
map('n', '<leader>n', ':NvimTreeFocus<CR>')
map('n', '<leader>c', ':NvimTreeCollapse<CR>')

-- Nvim Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

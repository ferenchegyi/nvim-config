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

_G.toggle_nvim_tree_focus = function()
  local nvim_tree = require('nvim-tree.api')
  if nvim_tree.tree.is_tree_buf() then
    vim.cmd('wincmd p') -- Move to previous window
  else
    nvim_tree.tree.focus() -- Focus NvimTree
  end
end
-- NvimTree binds
map('n', '<leader>n', ':lua _G.toggle_nvim_tree_focus()<CR>') 
map('n', '<leader>c', ':NvimTreeCollapse<CR>')

-- nvim telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'telescope help tags' })

-- Remove buffer

vim.keymap.set('n', '<S-d>', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })

  -- Find next buffer to switch to
  local target_buf = nil
  for _, buf in ipairs(buffers) do
    if buf.bufnr ~= current_buf then
      target_buf = buf.bufnr
      break
    end
  end

  if target_buf then
    vim.api.nvim_set_current_buf(target_buf)
  end

  vim.cmd('bd ' .. current_buf)
end, { desc = 'Delete buffer and switch' })

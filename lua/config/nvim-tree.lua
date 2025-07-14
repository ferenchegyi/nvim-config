-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 40,
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    group_empty = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

-- open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local is_dir = vim.fn.isdirectory(data.file) == 1
    local is_file = vim.fn.filereadable(data.file) == 1
    local is_no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if is_dir then
      -- user ran `nvim .`: open tree and focus it
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    elseif is_file or is_no_name then
      -- file or new buffer: open tree without focusing it,
      -- and highlight the current file
      require("nvim-tree.api").tree.toggle({
        focus = false,
        find_file = true,
      })
    end
  end,
})

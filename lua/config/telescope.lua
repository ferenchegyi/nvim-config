require('telescope').setup({
  defaults = {
    -- UI settings
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    -- Sorting & preview
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { preview_width = 0.6 },
      prompt_position = "top",
    },

    file_ignore_patterns = {
      "node_modules",
      "%.git/",
      "dist/",
      "build/"
    },

    -- Mappings inside Telescope
    mappings = {
      i = {                      -- Insert mode mappings
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Esc>"] = require('telescope.actions').close,
      },
      n = {                      -- Normal mode mappings
        ["q"] = require('telescope.actions').close,
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,  -- show dotfiles
      -- initial_mode = "normal", -- you can override per picker
    },
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
    },
  },

  extensions = {
    fzf = {  -- optional but recommended
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- Load fzf extension if installed
pcall(require('telescope').load_extension, 'fzf')

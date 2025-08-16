return {
  cmd = { 'css-languageserver', '--stdio' },
  filetypes = { 'css' },
  root_markers = { 'package.json' },  -- Adjust as needed
  settings = {
    css = {
      format = {
        enable = true,
      },
      validate = true,
    },
  },
}

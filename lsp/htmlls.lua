return {
  cmd = { 'html-languageserver', '--stdio' },
  filetypes = { 'html', 'htm' },
  root_markers = { 'index.html', 'package.json' },
  settings = {
    html = {
      format = {
        enable = true,
      },
      validate = true,
    },
  },
}

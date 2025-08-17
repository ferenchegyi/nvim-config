return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash' },
  root_markers = { '.git/', 'package.json' },
  settings = {
    bash = {
      diagnostics = {
        enable = true,
      },
      formatting = {
        enable = true,
      },
    },
  },
}

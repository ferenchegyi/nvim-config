return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact' },  -- Corresponds to .ts and .tsx files
  root_markers = { 'tsconfig.json', 'package.json' },
  settings = {
    tsserver = {
      diagnostics = {
        enable = true,
      },
    }
  }
}

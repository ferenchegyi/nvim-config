return {
  'prettier/vim-prettier',
  run = 'npm install', -- Installs prettier in the plugin directory
  ft = { 'javascript', 'typescript', 'json', 'css', 'markdown', 'html' },
  config = function()
    -- Optional: Customize Prettier settings (these are vim-prettier specific)
    vim.g['prettier#autoformat'] = 1 -- Enable autoformat on save
    vim.g['prettier#exec_cmd'] = 'prettier' -- Path to prettier executable
    vim.g['prettier#quickfix_enabled'] = 0 -- Disable quickfix window for errors
    vim.g['prettier#autoformat_require_pragma'] = 0 -- Format files even without @format pragma

    -- Ensure Prettier runs on save for specified filetypes
    vim.cmd [[
      autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.md,*.html Prettier
    ]]
  end,
}

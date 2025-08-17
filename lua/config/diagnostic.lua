-- Custom prefixes for different diagnostic types
local prefixes = {
  Error = '✖',    -- Prefix for errors
  Warn = '⚠',     -- Prefix for warnings
  Info = 'ℹ',     -- Prefix for info messages
  Hint = '➤',     -- Prefix for hints
}

-- Configure diagnostics with custom prefixes
vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return prefixes.Error
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return prefixes.Warn
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return prefixes.Info
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return prefixes.Hint
      end
      return '' -- Default case
    end,
    spacing = 4,  -- Space between the prefix and the message
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Add space for the status symbol next to the line
-- so for example the Error symbol won't make the screen jump
vim.wo.signcolumn = 'yes'

-- Optionally, set highlight groups for the signs
vim.cmd [[
  highlight DiagnosticSignError guifg=#ff0000
  highlight DiagnosticSignWarn guifg=#ffa500
  highlight DiagnosticSignInfo guifg=#0000ff
  highlight DiagnosticSignHint guifg=#008000
]]

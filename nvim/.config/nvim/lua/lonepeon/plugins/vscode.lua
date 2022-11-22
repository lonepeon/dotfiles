require('vscode').setup({
  transparent = true,
  italic_comments = true,
})

local colors = require('vscode.colors');
vim.cmd('hi default NeotestPassed guibg=' .. colors.vscGitAdded .. ' guifg=' .. colors.vscBack)
vim.cmd('hi default NeotestFailed guibg=' .. colors.vscGitDeleted .. ' guifg=' .. colors.vscBack)

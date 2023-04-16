local neotest = require('neotest')

neotest.setup({
	adapters = {
		require("neotest-rust"),
		require("neotest-go"),
	},
	output = {
		enabled = true,
		open_on_run = "short"
	},
	run = {
		enabled = true
	},
	default_strategy = "integrated",
	status = {
		enabled = true,
		signs = true,
		virtual_text = false
	},
  icons = {
    passed = "✓",
    running = ".",
    skipped = "/",
    unknown = "?",
    failed = "x",
  },
  highlights = {
    passed = 'GitSignsAdd',
    failed = 'GitSignsDelete',
  }
})

vim.keymap.set('n', '<leader>tr', "", {callback = function() neotest.output.open() end})
vim.keymap.set('n', '<leader>tt', "", {callback = function() neotest.run.run() end})
vim.keymap.set('n', '<leader>tf', "", {callback = function() neotest.run.run(vim.fn.expand("%")) end})
vim.keymap.set('n', '<leader>ts', "", {callback = function() neotest.run.stop() end})

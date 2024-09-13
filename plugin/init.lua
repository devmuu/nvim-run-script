local runscript = require("run-script-module")
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.api.nvim_create_user_command("InfoRunScript", runscript.info, {})
vim.api.nvim_create_user_command("RunLineScript", runscript.runLine, {})
vim.api.nvim_create_user_command("RunFileScript", runscript.runFile, {})
vim.api.nvim_create_user_command("ClearFileScript", lua require('run-script-module').clearFile, {})

-- run current line
map("n", "<c-CR>", "<Cmd>RunFileScript<CR>", opts)

-- run file from selected lines
map("x", "<c-CR>", "<Cmd>RunFileScript<CR>", opts)

-- clean script temp file
map("n", "<F9>", "<Cmd>lua require('run-script-module').clearFile()<CR>", opts)

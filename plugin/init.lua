local runscript = require("run-script-module")

vim.api.nvim_create_user_command("InfoRunScript", runscript.info, {})
vim.api.nvim_create_user_command("RunLineScript", runscript.runLine, {})
vim.api.nvim_create_user_command("RunFileScript", runscript.runFile, {})
vim.api.nvim_create_user_command("ClearFileScript", runscript.clearFile, {})

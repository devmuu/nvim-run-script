local runscript = require("run-script-module")

vim.api.nvim_create_user_command("InfoTestRun", runscript.info, {})
vim.cmd [[command! RunScriptInfo lua require("run-script-module").info()]]

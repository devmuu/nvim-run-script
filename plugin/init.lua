local runscript = require("run-script-module")

vim.api.nvim_create_user_command("InfoRunScript", runscript.info, {})

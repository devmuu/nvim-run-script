local runscript = require("run-script-module")

vim.cmd [[command! RunScriptInfo lua require("run-script-module").info()]]
vim.cmd [[command! RunScriptInfoTest lua runscript.info()]]

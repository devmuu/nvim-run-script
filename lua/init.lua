require("run_script_module")

vim.cmd [[ command! RunScriptInfo lua require("run_script_module").info() ]]

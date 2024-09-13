require("run_script_module")

vim.api.nvim_create_user_command("RunScriptInfo", function()
    require("run_script_module").info()
end, {})

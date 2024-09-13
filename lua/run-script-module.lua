local M = {}


-- info
function M.info()
    print("This is run-script module")
end

vim.api.nvim_create_user_command("InfoTestRun", info, {})

return M

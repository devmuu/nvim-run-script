local M = {}

-- variables in nvim termcodes
local ESC = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
local ENTER = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
local VISUAL = vim.api.nvim_replace_termcodes("v", true, false, true)

-- define terminal mode to run code
vim.g.local_term_mode = "split"


-- run command in a split terminal
function splitTerm(cmd)
    vim.cmd("botright vsplit")
    vim.fn.feedkeys(":" .. cmd .. " " .. ENTER)
end


-- get temp filename
function getFileName()
    local ft = vim.bo.filetype
    local script_file = "/tmp/script_lua_nvim." .. ft

    return(script_file)
end


-- get selected lines in current file
function getLines()
    -- get current mode in open buffer
    local modeinfo = vim.api.nvim_get_mode()
    local mode = modeinfo.mode

    if mode ~= "n" then
        -- press ESC inside select mode and preserve select keys
        vim.api.nvim_feedkeys(ESC, 'x', true)

        -- save selected text positions
        local vstart = vim.fn.getpos("'<")
        local vend = vim.fn.getpos("'>")

        -- get only position number
        line_start = vstart[2]
        line_end = vend[2]
    else
        local r,c = unpack(vim.api.nvim_win_get_cursor(0))
        line_start = r
        line_end = r
    end

    return({line_start, line_end})
end


function M.clearFile(filename)
    if filename == nil then
        filename = getFileName()
    end

    local f = io.open(filename, "w+")
        f:write("")
    f:close()
end


-- write file from selected lines
function writeFile(filename)
    local first = getLines()[1]
    local last = getLines()[2]
    local lines = vim.fn.getline(first, last)

    local f = io.open(filename, "a+")
    for i,v in ipairs(lines) do
        f:write(lines[i])
        f:write("\n")
    end
    f:close()
end


-- run current line like script
function M.runLine()
    local modeInfo = vim.api.nvim_get_mode()
    local mode = modeInfo.mode

    if mode ~= "n" then
        M.runFile(1)
    else
        local r,c = unpack(vim.api.nvim_win_get_cursor(0))
        local lines = vim.fn.getline(r, r)
        local cmd = "terminal Rscript -e '" .. lines[1] .. "'"

        vim.cmd(cmd)
    end
end


-- run script from file
function M.runFile(mod)
    local ft = vim.bo.filetype
    local script_file = "/tmp/script_lua_nvim." .. ft
    local cmd = "terminal ~/.local/bin/compile " .. script_file

    if mod == 0 then
        M.clearFile(script_file) print("Run file cleaned!")
    else
        writeFile(script_file)

        if vim.g.local_term_mode == "split" then
            splitTerm(cmd)
        else
            vim.cmd(cmd)
        end
    end
end


-- info
function M.info()
    print("This is run-script module")
end


return M

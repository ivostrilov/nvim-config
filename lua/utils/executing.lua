M = {}

function M.execute_selected_lua_lines()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    local code = table.concat(lines, '\n')

    local success, result = pcall(loadstring(code))
    if not success then
        print("Error executing code: " .. result)
    end
end

return M

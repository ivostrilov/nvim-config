-- Open Codex with the visual selection or the current file path.

local M = {}

local codex_command = [[codex --model gpt-6-luna -c 'model_reasoning_effort="low"']]
local paste_ready = "\27[?2004h"

local function open_codex(text)
  if vim.fn.executable("zsh") == 0 then
    vim.notify("zsh не найден в PATH", vim.log.levels.ERROR)
    return
  end

  vim.cmd("botright new")

  local output_tail = ""
  local pasted = false
  local job_id
  job_id = vim.fn.termopen({ "zsh", "-ic", codex_command }, {
    on_stdout = function(_, data)
      if pasted then
        return
      end

      -- Codex enables bracketed paste when its input is ready.
      local output = output_tail .. table.concat(data, "\n")
      if output:find(paste_ready, 1, true) then
        pasted = true
        vim.schedule(function()
          vim.api.nvim_chan_send(job_id, "\27[200~" .. text .. "\27[201~")
        end)
      else
        output_tail = output:sub(-#paste_ready + 1)
      end
    end,
  })

  vim.cmd("startinsert")
end

function M.open_with_selection()
  local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), {
    type = vim.fn.mode(),
  })
  local selection = table.concat(lines, "\n")
  if selection ~= "" then
    open_codex(selection)
  end
end

function M.open_with_file_path()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" or vim.bo.buftype ~= "" then
    vim.notify("У текущего буфера нет пути к файлу", vim.log.levels.WARN)
    return
  end

  open_codex(path)
end

return M

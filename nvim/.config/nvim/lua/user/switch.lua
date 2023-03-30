local M = {}

M._last_extension = "c"

local function FileExisted(name)
  local f = io.open(name, 'r')
  if f == nil then
    return false
  end
  return true
end

function M.SwitchHeaderSource()
  local extension = vim.fn.expand("%:e")
  local path = vim.fn.expand("%:p:h:h")
  local file = vim.fn.expand("%:t:r")
  local f = nil
  -- print(extension)
  if extension == "c" or extension == "cpp" then
    -- local f = vim.cmd[[find %:t:r.h]]
    M._last_extension = extension
    f = path .. "/inc/" .. file .. ".h"
    vim.api.nvim_command("e"..f)
  else
    f = path .. "/src/" .. file .. "." .. M._last_extension
    if not FileExisted(f) then
      M._last_extension = "cpp"
      f = path .. "/src/" .. file .. "." .. M._last_extension
    end
    vim.api.nvim_command("e"..f)
  end
end


return M

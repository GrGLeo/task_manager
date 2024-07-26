-- lua/myplugin/init.lua
local M = {}

function M.open_floating_window()
  local opts = {
    relative = "editor",    -- Relative to the entire editor
    width = 150,             -- Width of the window
    height = 30,            -- Height of the window
    row = (vim.o.lines - 10) / 2, -- Center vertically
    col = (vim.o.columns - 50) / 2, -- Center horizontally
    style = "minimal",      -- Style of the window
    border = "single"       -- Border style
  }

  local buf = vim.api.nvim_create_buf(false, true) -- Create a new empty buffer
  local win = vim.api.nvim_open_win(buf, true, opts) -- Open the floating window

  -- Set the content of the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Hello, this is a floating window!"})

  -- Optionally set some window options
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal')
end

function M.close_floating_window()
  if current_win then
    vim.api.nvim_win_close(current_win, true)
    current_win = nil
  end
end

return M


M = {}

local splitString = function(inputStr, delimiter)
    if delimiter == nil then
        delimiter = "%s"  -- Default to whitespace if no delimiter is provided
    end

    local result = {}
    local start, _ = inputStr:find(delimiter)
    if start then
      table.insert(result, inputStr:sub(1, start - 1))
      table.insert(result, inputStr:sub(start, #inputStr))
    else
      table.insert(result, inputStr)
    end
    return result
end

local align_text = function(opts)
  local sep            = opts.args
  local line1          = vim.fn.getpos("'<")[2] - 1  -- Convert to 0-based index
  local line2          = vim.fn.getpos("'>")[2]      -- This is already 1-based, so we can use it directly
  local selected_lines = vim.api.nvim_buf_get_lines(0, line1, line2, false)

  local align_length = 0;
  local split_lines = {}
  for k,v in pairs(selected_lines) do
    local slice = splitString(v, sep)
    if (#slice < 2) then
      print("Line does not have seperator. Stoping")
      return
    end
    table.insert(split_lines, slice)

    if (align_length < #slice[1]) then
      align_length = #slice[1]
    end
  end

  output_lines = {}
  for k, v in pairs(split_lines) do
    table.insert(output_lines, v[1] .. string.rep(' ', align_length - #v[1]) .. v[2])
  end
  vim.api.nvim_buf_set_lines(0, line1, line2, false, output_lines)
end


-- Create a user command that calls the align_text function
vim.api.nvim_create_user_command("AlignText", align_text, {range = true, nargs = 1})

return M

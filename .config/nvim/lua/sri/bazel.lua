local Job = require 'plenary.job'
local Path = require 'plenary.path'

M = {}

local function find_workspace_root()
  local fname = vim.fn.expand '%:p'
  local initial_path = fname
  if initial_path == '' then
    return nil
  end
  local workspace = initial_path
  while 1 do
    local canditate = workspace .. '/' .. 'WORKSPACE'
    if vim.fn.filereadable(canditate) == 1 then
      return workspace
    end
    if workspace == '/' then
      break
    end
    workspace = vim.fn.fnamemodify(workspace, ':h')
  end
end

local function get_stdout(cmd, args)
  local stdout

  Job:new({
    command = cmd,
    args = args,
    cwd = vim.fn.getcwd(),
    on_stdout = function(_, data)
      stdout = data
    end,
  }):sync()

  return stdout
end

function M.get_file_build_label(filepath)
  return get_stdout('bazel', { 'query', filepath })
end

function M.get_package(filepath)
  local packagename = get_stdout('bazel', { 'query', filepath, '--output=package' })
  return string.format('//%s', packagename)
end

function M.get_target(filepath)
  filepath = string.gsub(vim.api.nvim_buf_get_name(0), vim.fn.getcwd() .. '/', '')
  local fullname = M.get_file_build_label(filepath)
  local package_wild_card = string.format('%s:*', M.get_package(filepath))

  local srcs_attr = string.format("attr('srcs', %s, %s)", fullname, package_wild_card)
  local hdrs_attr = string.format("attr('hdrs', %s, %s)", fullname, package_wild_card)
  local args = { 'query', hdrs_attr, 'union', srcs_attr }

  return get_stdout('bazel', args)
end

function M.get_target_for_buffer()
  local filepath = vim.fn.expand '%:p'
  local targetname = M.get_target(filepath)
  return targetname
end

function M.build_target(workspace_path, target)
  local Terminal = require('toggleterm.terminal').Terminal
  print(string.format('Building %s', target))
  local bb = Terminal:new {
    cmd = string.format('bazel build %s', target),
    display_name = 'Bazel Build',
    dir = workspace_path,
    close_on_exit = false,
    on_exit = function(_, _, _, _)
      vim.cmd 'cgetbuffer'
    end,
  }
  bb:toggle()
end

function M.run_target(workspace_path, target, cmd_args)
  local Terminal = require('toggleterm.terminal').Terminal
  local cmd = string.format('bazel run %s', target)
  if cmd_args then
    print(string.format('Running cmd with args: %s %s', cmd, cmd_args))
    cmd = string.format('%s %s', cmd, cmd_args)
  else
    print(string.format('Running %s', target))
  end
  local bb = Terminal:new {
    cmd = cmd,
    display_name = 'Bazel Run',
    dir = workspace_path,
    close_on_exit = false,
  }
  bb:toggle()
end

function M.get_test_name()
  local line = vim.api.nvim_get_current_line()
  local module_name, test_name = string.match(line, 'TEST[_F]+%(%s*(.*)%s*,%s*(.*)%s*%)')
  if module_name and test_name then
    return string.format('%s.%s', module_name, test_name)
  end
  return nil
end

function M.build_target_in_buffer()
  local filepath = vim.fn.expand '%:p'
  local targetname = M.get_target(filepath)
  M.build_target(vim.fn.getcwd(), targetname)
end

function M.run_target_in_buffer()
  local filepath = vim.fn.expand '%:p'
  local targetname = M.get_target(filepath)
  M.run_target(vim.fn.getcwd(), targetname)
end

function M.run_test_in_line()
  local filepath = vim.fn.expand '%:p'
  local targetname = M.get_target(filepath)

  local test_name = M.get_test_name()
  if test_name then
    M.run_target(vim.fn.getcwd(), targetname, string.format('-- --gtest_filter="%s"', test_name))
  end
end
return M

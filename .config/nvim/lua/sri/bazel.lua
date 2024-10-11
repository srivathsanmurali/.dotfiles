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
    on_close = function(_)
      vim.cmd 'copen 30'
    end,
  }
  bb:toggle()
end

function M.run_target(workspace_path, target)
  local Terminal = require('toggleterm.terminal').Terminal
  print(string.format('Running %s', target))
  local bb = Terminal:new {
    cmd = string.format('bazel run %s', target),
    display_name = 'Bazel Run',
    dir = workspace_path,
    close_on_exit = false,
  }
  bb:toggle()
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
return M

-- -- Highlight when yanking (copying) text
-- --  Try it with `yap` in normal mode
-- --  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
--
local vim = vim
local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group_name)
    api.nvim_command 'autocmd!'
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      api.nvim_command(command)
    end
    api.nvim_command 'augroup END'
  end
end

local autoCommands = {
  _open_folds = {
    { 'BufReadPost,FileReadPost', '*', 'normal zR' },
  },
  _general_settings = {
    { 'FileType', 'qf,help,man,lspinfo nnoremap', '<silent> <buffer> q :close<CR>' },
    { 'TextYankPost', '*', "silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})" },
    { 'BufWinEnter', '*', ':set formatoptions-=cro' },
    { 'FileType', 'qf', 'set nobuflisted' },
  },
  _text = {
    { 'FileType', 'gitcommit,markdown', 'setlocal wrap' },
    { 'FileType', 'gitcommit,markdown', 'setlocal spell' },
  },
  _sri = {
    { "BufWritePre", "*", [[%s/\s\+$//e]] }
  },
}

M.nvim_create_augroups(autoCommands)

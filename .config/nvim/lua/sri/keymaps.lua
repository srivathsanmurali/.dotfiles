-- Clear highlight on pressing <ESC> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', 'gt', ':tabnext', { desc = 'Next Tab' })
vim.keymap.set('t', 'gT', ':tabprev', { desc = 'Prev Tab' })
-- vim.keymap.set('n', '<leader>g', function() require("sri/terms").lazygit_toggle() end, { desc = '[L]azy [G]it'})

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Change to next buffer' })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Change to previous buffer' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Decrease the indent of the current selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Increase the indent of the current selection' })
vim.keymap.set('v', '/', '"fy/\\V<C-R>f<CR>', { desc = 'Search the current selection' })

-- Visual Block --
-- Move text up and down
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { desc = 'Move the current visual block down' })
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { desc = 'Move the current visual block down' })

-- Start a substitution with the current word
vim.keymap.set('n', 'S', ':%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>')

vim.keymap.set('n', '<leader>co', ':copen 40<CR>', { desc = 'QuickFix Open' })
vim.keymap.set('n', '<leader>cc', ':copen<CR>', { desc = 'QuickFix Close' })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "[E]xplore directory" })

-- DM keymaps

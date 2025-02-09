-- Set <space> as the leader key
-- Must happen before plugins are loaded otherwise wrong leader will be used.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.mouse = 'a'

vim.opt.showmode = false

-- Sync clipboard between OS and neovim
vim.opt.clipboard = 'unnamedplus'

-- Wrapped text will be indented the same as the start of the line
vim.opt.breakindent = true

-- Enable persistant undo
vim.opt.undofile = true

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sign column
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '█', nbsp = '␣' }

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- Set highlight on Search
vim.opt.hlsearch = true

-- Set true colors Used by bufferline
vim.opt.termguicolors = true

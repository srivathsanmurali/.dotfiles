local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>d", ":Bdelete<CR>", opts)

-- Insert --
-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set('v', '/', "\"fy/\\V<C-R>f<CR>" )

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
--vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>p", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
vim.keymap.set("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>", opts)
vim.keymap.set("n", "<leader>g", "<cmd>Gitsigns blame_line<cr>", opts)
vim.keymap.set("n", "<leader>h", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>", opts)


-- helpers
vim.keymap.set("n", "<leader>x", ":lua require('toggle-checkbox').toggle()<CR>")

-- search
vim.keymap.set("n", "S", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")

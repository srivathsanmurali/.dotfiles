local options = { 
  -- [[ Data ]]
  backup = false,
  swapfile = false,
  undofile = true,          -- enable persistent undo
  
  -- [[ Timing ]]
  timeoutlen = 1000,        -- timeout for mapping completion
  updatetime = 300,         -- faster completion (4000ms default)
  
  -- [[ Filetypes ]]
  encoding = 'utf8',
  fileencoding = 'utf8',
  
  -- [[ ui ]]
  cmdheight = 1,
  colorcolumn = '80',
  number = true,
  numberwidth = 4,
  pumheight = 10,           -- pop up menu
  relativenumber = false,
  scrolloff = 8,
  showmode = false,
  showtabline = 2,          -- always show tabs,
  sidescrolloff = 8,
  signcolumn = "yes",
  syntax = "ON",
  termguicolors = true,
  
  -- [[ Search ]]
  hlsearch = false,
  ignorecase = true,
  incsearch = true,
  smartcase = true,
  
  -- [[ whitespace ]]
  expandtab = true,
  shiftwidth = 4,
  softtabstop = 4,
  tabstop = 4,
  wrap = true,
  
  -- [[ Splits ]]
  splitbelow = true,
  splitright = true,
  
  -- [[ Mouse ]]
  mouse = "a",
  }

vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"
--vim.opt.iskeyword:append "-"

for k, v in pairs(options) do
  vim.opt[k] = v
end

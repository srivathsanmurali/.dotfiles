return {
  { "nvim-lua/plenary.nvim", name = "plenary" },
  { "tpope/vim-fugitive" },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {},
    opts = { signs = false },
  },
  -- TODO: Figure out how to use nvim built in commenting with block commenting
  { "numToStr/Comment.nvim", lazy = false, opts = {}},
  {
    "folke/persistence.nvim",
    -- this will only start session saving when an actual file was opened
    event = "BufReadPre",
    keys = {
      {'<leader>ls', function() require("persistence").load() end, desc = '[L]oad [S]ession'},
    },
  },
}

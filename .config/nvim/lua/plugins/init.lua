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
}

return {
  {
    "folke/snacks.nvim",
    priority=1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        enabled = true,
        img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "_attachments"},
      },
      bufdelete = { enabled = true },
      lazygit   = { enabled = true },
      picker    = { enabled = true },
      terminal  = { enabled = true },
    },
    keys = {
      {"<leader>d", function() Snacks.bufdelete() end, { desc = "Delete current buffer" } },
      {"<leader>g", function() Snacks.lazygit() end, { desc = "[L]azy [G]it" } },
      {"<C-\\>"   , function() Snacks.terminal.toggle() end, mode = { "n", "t" }, { desc = "Toggle [T]erminal" } },
      -- LSP pickers
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "[G]oto [d]Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "[G]oto [D]eclaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "[G]oto [R]eferences" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "[G]oto [I]mplementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "[G]oto T[y]pe Definition" },
      -- Search pckers
      { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Search Buffers" },
      { "<leader>sh"     , function() Snacks.picker.help() end, desc = "[S]earch [H]elp pages" },
      { "<leader>sm"     , function() Snacks.picker.man() end, desc = "[S]earch [M]an Pages" },
      { "<leader>sq"     , function() Snacks.picker.qflist() end, desc = "[S]earch [Q]uickfix List" },
      { "<leader>ss"     , function() Snacks.picker.lsp_symbols() end, desc = "[S]earch [S]ymbols in Buffer" },
      { "<leader>sw"     , function() Snacks.picker.grep_word() end, desc = "[S]earch Current [W]ord", mode = { "n", "x" } },
      { '<leader>p'      , function() Snacks.picker.git_files() end, { desc = '[S]earch [G]it Files' } },
      { '<leader>sf'     , function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' } },
      { '<leader>sg'     , function() Snacks.picker.grep() end, { desc = '[S]earch [F]iles' } },
    }
  }
}

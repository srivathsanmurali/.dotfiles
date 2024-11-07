return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup()

      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'WhoIsSethDaniel/lualine-lsp-progress.nvim',
    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'filename', 'searchcount' },
          lualine_c = { 'branch', 'diff', 'diagnostics', 'lsp_progress' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {}
      vim.keymap.set('n', '<leader>e', '<cmd>:Oil<CR>', { desc = 'Open File [E]xplorer' })
    end,
  },
  {
    'famiu/bufdelete.nvim',
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup {
        options = {
          close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
          right_mouse_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
          left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        },
      }
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      -- {
      --   '<leader>xx',
      --   '<cmd>Trouble diagnostics toggle<cr>',
      --   desc = 'Diagnostics (Trouble)',
      -- },
      -- {
      --   '<leader>cs',
      --   '<cmd>Trouble symbols toggle focus=false<cr>',
      --   desc = 'Symbols (Trouble)',
      -- },
      -- {
      --   '<leader>cl',
      --   '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      --   desc = 'LSP Definitions / references / ... (Trouble)',
      -- },
      -- {
      --   '<leader>xL',
      --   '<cmd>Trouble loclist toggle<cr>',
      --   desc = 'Location List (Trouble)',
      -- },
      {
        '<leader>tt',
        '<cmd>Trouble qflist toggle<cr>',
        desc = '[T]oggle [T]rouble Quickfix',
      },
      {
        '<leader>td',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = '[T]oggle [D]iagnostics (Trouble)',
      },
    },
  },
}

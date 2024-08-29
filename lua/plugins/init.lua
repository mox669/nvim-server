return {
  -----
  -- UI
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup({
        indent = { char = '▏' },
        scope = { enabled = false },
      })
    end,
  },
  -- colorschemes
  -- use({ 'mox669/fogbell.vim', branch = 'mox' })
  {
    'zootedb0t/citruszest.nvim',
    lazy = false,
    priority = 999,
  },

  ----------
  -- UTILITY
  {
    'ojroques/nvim-bufdel',
    config = function()
      require('bufdel').setup({
        quit = false,
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        default_file_explorer = false,
      })

      vim.keymap.set(
        'n',
        '-',
        '<CMD>Oil<CR>',
        { desc = 'Open parent directory' }
      )
    end,
  },

  ------
  -- GIT
  'tpope/vim-fugitive',

  ------
  -- LSP
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-cmdline',
  ------
  -- Deps
  'nvim-lua/plenary.nvim',
  {
    'vhyrro/luarocks.nvim',
    lazy = false,
    priority = 1000,
    config = true,
  },
} -- [[ end init.lua ]]

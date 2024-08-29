--------
-- Telescope configuration
-- Source: https://github.com/nvim-telescope/telescope.nvim
--------

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = {
    -- Live grep
    {
      '<Leader>ps',
      function()
        require('telescope.builtin').live_grep(
          require('telescope.themes').get_dropdown({})
        )
      end,
    },
    -- Find file
    {
      '<Leader>pf',
      function()
        require('telescope.builtin').find_files(
          require('telescope.themes').get_dropdown({})
        )
      end,
    },
    -- -- Help tags
    {
      '<Leader>ph',
      '<CMD>Telescope help_tags<CR>',
    },
    -- -- Man pages
    {
      '<Leader>pn',
      '<CMD>Telescope man_pages<CR>',
    },
  },
  config = function()
    local telescope = require('telescope')
    local telescopeConfig = require('telescope.config')

    local vimgrep_arguments =
      { unpack(telescopeConfig.values.vimgrep_arguments) }

    table.insert(vimgrep_arguments, '--hidden')
    table.insert(vimgrep_arguments, '--glob')
    table.insert(vimgrep_arguments, '!**/.git/*')

    telescope.setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        },
        grep_string = {},
      },
      extensions = {},
    })

    require('telescope').load_extension('notify')
  end,
}

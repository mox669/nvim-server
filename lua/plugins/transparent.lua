--------
-- Transparent configuration
-- Source: https://github.com/xiyaowong/transparent.nvim
--------

return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  keys = {
    { '<Leader>tr', '<CMD>TransparentToggle<CR>' },
  },
  config = function()
    require('transparent').setup({
      exclude_groups = {
        'SignColumn',
        'LineNr',
        'CursorLineNr',
        'CursorLine',
      },
    })
  end,
}

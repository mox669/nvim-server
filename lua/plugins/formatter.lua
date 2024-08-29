--------
-- gitsigns configuration
-- Source: https://github.com/mhartington/formatter.nvim
--------

return {
  {
    'mhartington/formatter.nvim',
    lazy = false,
    config = function()
      require('formatter').setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          lua = {
            require('formatter.filetypes.lua').stylua,
          },
          yaml = {
            require('formatter.filetypes.yaml').yamlfmt,
          },
          python = {
            require('formatter.filetypes.python').autopep8,
          },
          ['*'] = {
            require('formatter.filetypes.any').remove_trailing_whitespace,
          },
        },
      })

      vim.cmd([[
        augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWrite
        augroup END
      ]])
    end,
  },
}

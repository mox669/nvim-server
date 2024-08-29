-- vim.cmd([[
--   function! Highlights() abort
--       highlight NeoTreeNormal guibg=#0b0b0b
--       highlight NeoTreeNormalNC guibg=#0b0b0b
--       highlight NeoTreeWinSeparator guibg=#0b0b0b guifg=#0b0b0b
--       highlight ToggleTerm1Normal guibg=#000000 guifg=#ffffff
--       highlight TelescopeNormal guibg=#0b0b0b
--       highlight TelescopeBorder guifg=#cccccc guibg=#444444
--       highlight Visual guibg=#4567d6
--       highlight CopilotSuggestion guifg=#555555 ctermfg=8
--       highlight LazyGitFloat guibg=#0b0b0b
--       highlight LazyGitBorder guibg=#444444
--       highlight MarkSignHL guibg=#0b0b0b guifg=#ffffff gui=bold
--       highlight ColorColumn guibg=#2a2a2a
--       highlight SignColumn guibg=#0f0f0f
--       highlight CursorLine guibg=#222222
--       highlight LineNr guibg=#1b1b1b
--       highlight CursorLineNr guibg=#1b1b1b
--       highlight GitSignsAdd guibg=#0f0f0f
--       highlight GitSignsChange guibg=#0f0f0f
--       highlight GitSignsDelete guibg=#0f0f0f
--       highlight DiagnosticSignError guibg=#0f0f0f
--       highlight DiagnosticSignWarn guibg=#0f0f0f
--       highlight DiagnosticSignInfo guibg=#0f0f0f
--       highlight DiagnosticSignHint guibg=#0f0f0f
--       highlight Comment guifg=#787878
--
--   endfunction
--
--   augroup MoxHigh
--     autocmd!
--     au ColorScheme * call Highlights()
--   augroup END
--
--   set background=dark
--   " colorscheme fogbell
--   colorscheme biscuit
-- ]])

vim.cmd([[
  function! Highlights() abort
      highlight DiagnosticSignError                    guibg=#181818 guifg=#e5412b
      highlight DiagnosticVirtualTextError                           guifg=#f92307 gui=bold
      highlight DiagnosticSignWarn                     guibg=#181818 guifg=#e59347
      highlight DiagnosticVirtualTextWarn                            guifg=#fc851e gui=bold
      highlight DiagnosticSignInfo                     guibg=#181818
      highlight DiagnosticSignHint                     guibg=#181818
      highlight NotifyBackground                       guibg=#0b0b0b
      highlight @neorg.tags.ranged_verbatim.code_block guibg=#202020
  endfunction

  augroup MoxHigh
    autocmd!
    au ColorScheme * call Highlights()
  augroup END
  set background=dark
  colorscheme citruszest
]])

vim.fn.sign_define(
  'DiagnosticSignError',
  { text = ' ', texthl = 'DiagnosticSignError' }
)
vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = ' ', texthl = 'DiagnosticSignWarn' }
)
vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = ' ', texthl = 'DiagnosticSignInfo' }
)
vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '󰌵', texthl = 'DiagnosticSignHint' }
)

--------
-- nvim-cmp configuration
-- Source: https://github.com/hrsh7th/nvim-cmp
--------

return {
  'hrsh7th/nvim-cmp',
  config = function()
    vim.opt.completeopt = 'menu,menuone,noselect'

    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
      return
    end

    local check_backspace = function()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
    end

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        border = {},
        scrollbar = ' ',
      },
      mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif check_backspace() then
            -- cmp.complete()
            fallback()
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
      },
      formatting = {
        fields = { 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- NOTE: order matters
          vim_item.menu = ({
            nvim_lsp = '(Lsp)',
            nvim_lua = '(Nvim)',
            buffer = '(Buffer)',
            path = '(Path)',
          })[entry.source.name]
          return vim_item
        end,
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              return { vim.api.nvim_get_current_buf() }
            end,
          },
        },
        { name = 'path' },
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      view = {
        entries = 'native',
      },
    })
  end,
}

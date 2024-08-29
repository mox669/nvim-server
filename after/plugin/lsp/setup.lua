local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local util = require('lspconfig.util')
local cmp_lsp = require('cmp_nvim_lsp')

local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  vim.list_extend(
    capabilities.textDocument.completion.completionItem.resolveSupport.properties,
    {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  )
  return cmp_lsp.default_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  if config.on_attach then
    config.on_attach =
      util.add_hook_after(config.on_attach, require('mox.lsp.on_attach'))
  else
    config.on_attach = require('mox.lsp.on_attach')
  end
  config.capabilities = vim.tbl_deep_extend(
    'force',
    create_capabilities(),
    config.capabilities or {}
  )
end)

require('mason-lspconfig').setup({
  -- configure, which server should be ensured to be installed
  ensure_installed = {
    'lua_ls',
    'hydra_lsp', -- yaml
    'harper_ls', -- toml
  },
})

require('mason-lspconfig').setup_handlers({
  -- configure your lsp servers here
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          format = {
            enable = false,
          },
          hint = {
            enable = true,
            arrayIndex = 'Auto', -- "Enable", "Auto", "Disable"
            await = true,
            paramName = 'Literal', -- "All", "Literal", "Disable"
            paramType = true,
            semicolon = 'Disable', -- "All", "SameLine", "Disable"
            setType = true,
          },
          diagnostics = {
            globals = { 'P', 'vim', 'use' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
  ['hydra_lsp'] = function()
    lspconfig.hydra_lsp.setup({})
  end,
  ['harper_ls'] = function()
    lspconfig.harper_ls.setup({
      filetypes = { 'toml' },
    })
  end,
})

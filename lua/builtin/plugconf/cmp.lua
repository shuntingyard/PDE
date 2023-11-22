-- See `:help cmp`
--  This config heavily relies on https://youtu.be/_DnmphIwnjo
local cmp = require 'cmp'

local ls = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
ls.config.setup {}

local lspkind = require 'lspkind'
-- lspkind.init() -- Deprecated, see initialization below.

---@diagnostic disable-next-line: missing-fields
cmp.setup {
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    -- For select next/previous we lean on <C-n>/<C-p>
    -- (as is customary in Vim insert mode).
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert, --Default made explicit
      select = true,
    },

    ['<C-Space>'] = cmp.mapping.complete {},

  },

  -- Order is priority of recommendations:
  sources = {
    { name = 'nvim_lua' }, -- This engine is knowledgeable enough to enable itself only in Lua buffers.
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer',  keyword_length = 5 }, -- Text within current buffer
    { name = 'path' },                        -- FS paths
  },

  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      with_text = true,
      menu = {              -- TJ's labels below, possibly to be adapted.
        buffer = "[buf]",
        luasnip = "[snip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
      }
    }
  },

  -- Show what's gonna be there after completion.
  experimental = {
    ghost_text = true,
  }
}

-- `/` cmdline setup.
---@diagnostic disable-next-line: missing-fields
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' } -- Requires `cmp-buffer`
  }
})

-- `:` cmdline setup.
---@diagnostic disable-next-line: missing-fields
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

-- vim: ts=2 sts=2 sw=2 et

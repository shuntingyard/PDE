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
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      -- behavior = cmp.ConfirmBehavior.Replace,
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
      menu = {              -- Teej's labels below, possibly to be adapted.
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

----- Testing snippet with input parms --------------------*
local snip = ls.snippet
---@diagnostic disable-next-line: unused-local
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
---@diagnostic disable-next-line: unused-local
local func = ls.function_node
---@diagnostic disable-next-line: unused-local
local choice = ls.choice_node
---@diagnostic disable-next-line: unused-local
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
  all = {
    snip({
        trig = "meta",
        namr = "Metadata",
        dscr = "Yaml metadata format for markdown"
      },
      {
        text({ "---",
          "title: " }), insert(1, "note_title"), text({ "",
        "author: " }), insert(2, "author"), text({ "",
        "categories: [" }), insert(3, ""), text({ "]",
        "tags: [" }), insert(4), text({ "]",
        "comments: true",
        "---", "" }),
        insert(0)
      }),

  },
})
-----------------------------------------------------------*

-- vim: ts=2 sts=2 sw=2 et

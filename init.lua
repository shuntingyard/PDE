--[[

  Much influenced by

    - Teej's https://github.com/nvim-lua/kickstart.nvim
    - ThePrimeagen's "Neovim RC From Scratch" (https://youtu.be/w7i4amO_zaE)

]]

-- Must happen before plugins are required (otherwise wrong leader will be used).
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- A balanced colorscheme that even works in the Linux console. See `:help sonokai.txt`
  { 'sainnhe/sonokai',   priority = 1000 },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim', -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'netrw', 'help' }, -- Disable it on netrw, help, ...
      },
    },
  },

  -- Progress updates for LSP
  { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }, -- `opts = {}` is equivalent to setup({})

  -- Git
  {
    'lewis6991/gitsigns.nvim', -- See `:help gitsigns.txt`
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '|' },
      },
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, {
          buffer = bufnr, desc = '[G]o to [P]revious Hunk'
        })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, {
          buffer = bufnr, desc = '[G]o to [N]ext Hunk'
        })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, {
          buffer = bufnr, desc = '[P]review [H]unk'
        })
      end,
    },
  }, -- Might want to include 'NeogitOrg/neogit' (Magit-like) at a later point in time.

  -- LSP specials for Neovim's lua API
  { 'folke/neodev.nvim',       opts = {} },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim',          config = true },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',               -- Required
        dependencies = {
          'L3MON4D3/LuaSnip',             -- Required
          'saadparwaiz1/cmp_luasnip',     -- Association with nvim-cmp source
          'hrsh7th/cmp-nvim-lsp',         -- Required, provides LSP completion capabilities.
          'rafamadriz/friendly-snippets', -- More user-friendly snippets
        },
      },
    },
  },

  -- Heuristics for expandtab and shiftwidth
  'tpope/vim-sleuth',

  -- Better editing: comments
  {
    -- Supports commentstring, see: `:h comment.commentstring`.
    -- Supports line and block comments.
    'numToStr/Comment.nvim', opts = {}
  },

  -- Better editing: parenthesis completion
  {
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    opts = {} -- Equivalent to setup({})
  },

  -- Greeter
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  -- Include plugins enabled on demand.
  { import = 'yourdir.enabled' },

}, {})

-- Lua objects human-readable - thanks bashbunni & Teej :)
P = function(v)
  print(vim.inspect(v))
  return v
end
--P(vim.opt.rtp)

require('builtin.mappings')
require('builtin.settings')
require('builtin.plugconf.neodev') -- Always run BEFORE lspconfig.
require('builtin.plugconf.lsp')
require('builtin.plugconf.cmp')
require('builtin.plugconf.greeter')

require('optional') -- Important to run this last, as things might depend on builtin.

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

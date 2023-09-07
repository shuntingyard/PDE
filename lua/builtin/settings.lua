-- Settings should not deviate too much from tpope/vim-sensible.

--vim.o.spell = true
--vim.o.spelllang = 'en'

-- Make netrw nicer (see https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/)
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = -24 -- Nwgative means absolute values.
vim.g.netrw_banner = 0    -- Use `I` inside netrw to show it temporarily.
--vim.g.netrw_localcopydircmd = 'cp -r'

-- Color scheme and UI
vim.o.background = 'dark'
vim.o.t_Co = 256
vim.o.termguicolors = true
vim.g.sonokai_style = 'atlantis' -- default, atlantis, andromeda, shusia, maia, espresso
vim.g.sonokai_better_performance = 1
vim.g.sonokai_transparent_background = 1
vim.cmd.colorscheme('sonokai')
-- TODO Set visual highlighting that looks nice in Linux terminals.
vim.wo.signcolumn = 'yes'

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Scrolling and wrapping
vim.o.scrolloff = 1
vim.o.sidescroll = 1
vim.o.sidescrolloff = 2
--vim.o.wrap = false
vim.o.breakindent = true -- Only of interest when wrap is on.

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 500 -- Decrease time to enter a keymap sequence

-- Undo settings
vim.o.undofile = true

-- Completion
vim.o.completeopt = 'menu,menuone,preview,noselect'

-- Mouse and system clipboard
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Too much clutter for my feeling, so diagnostics are not underlined.
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false
  }
)

-- Without underlining 'virtual_text' is rather nice.
vim.diagnostic.config({ virtual_text = true })

-- vim: ts=2 sts=2 sw=2 et

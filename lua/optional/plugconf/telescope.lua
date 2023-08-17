-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  -- Vertical layout strategy: picker's drop-downs seem to be more robust.
  pickers = {
    -- Mapped to some key here
    git_files = {
      theme = "dropdown",
      layout_strategy = 'center',
      layout_config = { height = 0.4, width = 0.85 },
    },
    find_files = {
      theme = "dropdown",
      layout_strategy = 'center',
      layout_config = { height = 0.4, width = 0.85 },
    },
    grep_string = {
      theme = "dropdown",
      layout_strategy = 'center',
      layout_config = { height = 0.4, width = 0.85 },
    },
    live_grep = {
      theme = "dropdown",
      layout_strategy = 'center',
      layout_config = { height = 0.4, width = 0.85 },
    },
    diagnostics = {
      theme = "dropdown",
      layout_strategy = 'center',
      layout_config = { height = 0.4, width = 0.85 },
    },
    -- Used in greeter
    oldfiles = {
      theme = "dropdown",
      layout_strategy = 'center',
      layout_config = { height = 0.4, width = 0.85 },
    },
  },
}

-- Enable telescope fzf native, if installed.
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`.
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, {
  desc = '[?] Find recently opened files'
})
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, {
  desc = '[ ] Find existing buffers'
})
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, {
  desc = '[S]earch current [W]ord'
})
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, {
  desc = '[S]earch [D]iagnostics'
})

-- vim: ts=2 sts=2 sw=2 et

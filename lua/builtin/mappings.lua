-- See `help: vim.keymap.set()`
--  The idea here is to define all key mappings in one place.

-- Teej
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- For word wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Prime
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual selection down intelligently' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual selection up intelligently' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down, cursor center screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up, cursor center screen' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result, cursor center screen' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result, cursor center screen' })

-- Me
vim.keymap.set('n', '<leader>f', vim.cmd.Lexplore, { desc = 'Toggle netrw' })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Page down, cursor center screen' })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Page up, cursor center screen' })

-- vim: ts=2 sts=2 sw=2 et

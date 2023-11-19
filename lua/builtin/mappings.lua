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

-- Me for `luasnip`
--[[
if pcall(require, 'luasnip') then
  local ls = require('luasnip')
  vim.keymap.set('i', 'C-k', function() ls.expand() end, { silent = true, desc = 'Expand snippet' })
  vim.keymap.set({ 'i', 's' }, 'C-l', function() ls.jump(1) end,
    { noremap = true, silent = true, desc = 'Forward in snippet' })
  vim.keymap.set({ 'i', 's' }, 'C-j', function() ls.jump(-1) end,
    { noremap = true, silent = true, desc = 'Back in snippet' })
  vim.keymap.set({ 'i', 's' }, 'C-e', function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true, desc = 'Change active choice in snippet' })
end
 ]]
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- vim: ts=2 sts=2 sw=2 et

-- Dependencies for null-ls (including management of Mason-provided components via mason-null-ls)
--
-- TODO As 'null-ls.nvim' will will soon be archived, watch if we run into a deprecation problem.

return {
  'jay-babu/mason-null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'nvim-lua/plenary.nvim',
  }
}

-- vim: ts=2 sts=2 sw=2 et

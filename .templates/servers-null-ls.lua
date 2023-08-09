-- Attach Mason 3rd-party programs to buffers as though they spoke all LSP.
--  Note: This is my list, yours might look very different.

-- A copy of this should be placed in "$XDG_CONFIG_HOME/nvim/lua/yourdir/lsp/servers-null-ls.lua".
-- This configuration will only be read when '../lua/optional/available/null-ls.lua' is enabled.

require('mason-null-ls').setup({
  automatic_installation = true,
  ensure_installed = {
    'black',
    --'clang-format',
    --'cpplint',
    'markdownlint',
    'mypy',
    'ruff',
  },
})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- Configure the tools you have installed and make sure they're among null-ls' built-ins:
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

    -- Linters, static checks
    --null_ls.builtins.diagnostics.clang_check, -- Cool linter, alas not in Mason, so you're on your own!
    --null_ls.builtins.diagnostics.cpplint,     -- Google style cpp
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    -- Formatters
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.markdownlint,
  }
})

-- vim: ts=2 sts=2 sw=2 et

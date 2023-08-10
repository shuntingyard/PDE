--[[
      Template for installation/configuration of null-ls servers.

      When a copy of this is placed inside directory "$XDG_CONFIG_HOME/nvim/lua/yourdir/lsp/", and named
      "servers-null-ls.lua", it will be evaluated with Lua's `dofile` function, provided your configuration
      has '../lua/optional/available/null-ls.lua' enabled!

      Adapt copy according to specific use-cases:
]]
require('mason-null-ls').setup({
  automatic_installation = true,
  ensure_installed = {
    'beautysh',
    'black',
    'clang-format',
    --'cpplint',
    'markdownlint',
    'mypy',
    'ruff',
    'sqlfluff',
  },
})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- Configure the tools you have installed and make sure they are among null-ls' built-ins:
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

    -- Linting, static code analysis
    --null_ls.builtins.diagnostics.clang_check, -- Cool linter, activate in case you have it available.
    --null_ls.builtins.diagnostics.cpplint,     -- Google style cpp
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { '--dialect', 'sqlite' },   -- Change to your dialect, e.g. 'postgres'.
    }),

    -- Formatters
    null_ls.builtins.formatting.beautysh, -- Filetypes: bash, csh, ksh, sh, zsh
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { '--dialect', 'sqlite' },   -- Change to your dialect, e.g. 'sqlite'.
    }),
  }
})

-- vim: ts=2 sts=2 sw=2 et

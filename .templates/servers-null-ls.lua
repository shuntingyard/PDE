--[[
      Template for installation/configuration of null-ls servers.

      When a copy of this is placed inside directory "$XDG_CONFIG_HOME/nvim/lua/yourdir/lsp/", and named
      "servers-null-ls.lua", it will be evaluated with Lua's `dofile` function, provided your configuration
      has '../lua/optional/available/null-ls.lua' enabled!

      In your copy do add things or [un]comment lines according to specific use-cases:
]]
require('mason-null-ls').setup({
  automatic_installation = true,
  ensure_installed = {
    --'beautysh',
    'black',
    'clang-format',
    --'cpplint',
    'markdownlint',
    'mypy',
    'ruff',
    --'shellcheck',
    'sqlfluff',
  },
})

local nls = require('null-ls')

nls.setup({
  sources = {
    -- Configure the tools you have installed and make sure they are among null-ls' built-ins:
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

    -- Linting, static code analysis
    --nls.builtins.diagnostics.clang_check, -- Cool linter, activate in case you have it available.
    --nls.builtins.diagnostics.cpplint,     -- Google style cpp
    nls.builtins.diagnostics.markdownlint,

    function()   -- Detect virtual environments for `mypy`.
      local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or nil
      if virtual -- `nil` is falsey in Lua.
      then
        -- What ternary expressions look like in Lua:
        local python = vim.loop.os_uname().sysname == 'Windows_NT' and '\\Scripts\\python' or '/bin/python3'
        return nls.builtins.diagnostics.mypy.with({
          extra_args = { '--python-executable', virtual .. python }
        })
      else
        return nls.builtins.diagnostics.mypy
      end
    end,

    nls.builtins.diagnostics.ruff,
    --nls.builtins.code_actions.shellcheck,
    nls.builtins.diagnostics.sqlfluff.with({
      extra_args = { '--dialect', 'ansi' }, -- See https://docs.sqlfluff.com/en/stable/ for dialects and configuration.
    }),

    -- Formatters
    --nls.builtins.formatting.beautysh, -- Filetypes: bash, csh, ksh, sh, zsh
    nls.builtins.formatting.black,
    nls.builtins.formatting.clang_format,
    nls.builtins.formatting.markdownlint,
    nls.builtins.formatting.sqlfluff.with({
      extra_args = { '--dialect', 'ansi' }, -- Often preferable to have '.sqlfluff' in project root.
    }),
  }
})

-- vim: ts=2 sts=2 sw=2 et

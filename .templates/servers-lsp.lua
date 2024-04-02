--[[
      Template for installation/configuration of LSP servers.

      When a copy of this is placed inside directory "$XDG_CONFIG_HOME/nvim/lua/yourdir/lsp/", and named
      "servers-lsp.lua", it will be evaluated with Lua's `dofile` function.

      In your copy do add servers according to specific use-cases:
]]
require('lspconfig').ansiblels.setup({})                       -- `:set ft=yaml.ansible`
require('lspconfig').bashls.setup({})                          -- Via Mason (bash-language-server)
require('lspconfig').clangd.setup({})                          -- Via Mason unless you use clang anyway.
require('lspconfig').docker_compose_language_service.setup({}) -- Install via Mason.
require('lspconfig').dockerls.setup({})                        -- Via Mason (dockerfile-language-server)
require('lspconfig').gopls.setup({})                           -- `go install ... gopls@latest`
require('lspconfig').html.setup({})
require('lspconfig').jsonls.setup({})                          -- Via Mason (json-lsp)
require('lspconfig').marksman.setup({})                        -- Markdown support, install via Mason.
require('lspconfig').powershell_es.setup({})                   -- Works via Mason with 'pwsh' (PowerShell 7) on your path.
require('lspconfig').pyright.setup({})                         -- Install via Mason.
require('lspconfig').sqlls.setup({})                           -- For MySQL, PostgreSQL, SQLite3 - wants '.sqllsrc.json' in project root.
require('lspconfig').rnix.setup({})
require('lspconfig').yamlls.setup({})                          -- Via Mason (yaml-language-server)

require('lspconfig').hls.setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}                                              -- No Mason, use ghcup: `ghcup install hls`.

if not pcall(require, 'rust-tools') then       -- Special case: rust-tools over plain lspconfig.
  require('lspconfig').rust_analyzer.setup({}) -- Always install via rustup!
end

-- vim: ts=2 sts=2 sw=2 et

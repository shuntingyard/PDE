-- Template for the installation of LSP servers.
--  Note: This is my list, yours might look very different.

-- A copy of this should be placed in "$XDG_CONFIG_HOME/nvim/lua/yourdir/lsp/servers-lsp.lua".

require('lspconfig').ansiblels.setup({})                       -- Have ansible-lint installed and `:set ft=yaml.ansible`.
require('lspconfig').asm_lsp.setup({})                         -- Install via Mason. TODO Doesn't attach on Windows.
require('lspconfig').bashls.setup({})                          -- Install via Mason.
require('lspconfig').clangd.setup({})                          -- Via Mason unless you use clang anyway.
require('lspconfig').docker_compose_language_service.setup({}) -- Install via Mason. TODO smoke-test
require('lspconfig').dockerls.setup({})                        -- Install via Mason. TODO smoke-test
require('lspconfig').gopls.setup({})                           -- Rustacean's assumption: `$ go install gopls@latest`.

-- FIXME Not working with Mason, can't find the right hls version.
require('lspconfig').hls.setup({})             -- Install Haskell via ghcup and let Mason handle its LS.

require('lspconfig').marksman.setup({})        -- Markdown support, install via Mason.

require('lspconfig').powershell_es.setup({})   -- FIXME Linux, Windows: Spawning language server with cmd: `pwsh` failed.
require('lspconfig').pyright.setup({})         -- Install via Mason.
require('lspconfig').sqlls.setup({})           -- Via Mason, supports MySQL, PostgreSQL, and SQLite3.
require('lspconfig').yamlls.setup({})          -- Install via Mason. TODO smoke-test

if not pcall(require, 'rust-tools') then       -- Special case: rust-tools over plain lspconfig.
  require('lspconfig').rust_analyzer.setup({}) -- Install via rustup
end

-- vim: ts=2 sts=2 sw=2 et

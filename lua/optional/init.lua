-- As a general rule here we only require when available.

if pcall(require, 'nvim-treesitter') then
  require('optional.plugconf.treesitter')
end

-- DAP should go here.

if pcall(require, 'mason-null-ls') then
  require('optional.plugconf.null-ls') -- To be called after LSP setup
end

if pcall(require, 'rust-tools') then
  require('optional.plugconf.rust-tools') -- To be called after LSP setup
end

if pcall(require, 'telescope') then
  require('optional.plugconf.telescope')
end

-- vim: ts=2 sts=2 sw=2 et

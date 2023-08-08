--  Please remember: we need to load these after LSP has been setup.
local YOUR_NULL_LS_SERVERS = 'lua/yourdir/lsp/servers-null-ls.lua'

-- Custom null-ls configurations
local custom_null_ls_path = vim.api.nvim_get_runtime_file(YOUR_NULL_LS_SERVERS, false)[1]
if custom_null_ls_path then
  dofile(custom_null_ls_path)
end

-- vim: ts=2 sts=2 sw=2 et

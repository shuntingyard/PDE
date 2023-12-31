local YOUR_LSP_SERVERS = 'lua/yourdir/lsp/servers-lsp.lua'

local lsp = require('lsp-zero').preset({})

local patient_buf_format = function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })

  -- Sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>lf', patient_buf_format, '[L]SP [F]ormat')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  -- Things that are optionally telescopic
  if pcall(require, 'telescope.builtin') then
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  else
    nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
  end

  -- See `:help K` for why this keymap.
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')
end)

lsp.ensure_installed({
  'lua_ls',
})

-- We always want LSP for lua, and we want it in TJ's configuration.
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls({
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
}))

-- Custom LSP configurations
local custom_lsp_path = vim.api.nvim_get_runtime_file(YOUR_LSP_SERVERS, false)[1]
if custom_lsp_path then
  dofile(custom_lsp_path)
end

-- Run setup
lsp.setup()

-- Semgrep experiments (Remember: there's a more robust way to *integrate* new servers:
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#custom-servers)

--[[ 
local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.semgrep then
  lsp_configurations.semgrep = {
    default_config = {
      name = 'semgrep',
      cmd = { 'semgrep', 'lsp', '--debug' }, -- Last optional arg is --verbose or --debug for logging.
      filetypes = { 'html', 'python', 'rust' },
      root_dir = require('lspconfig.util').root_pattern('')
    }
  }
end
require('lspconfig').semgrep.setup({})
]]

-- vim: ts=2 sts=2 sw=2 et

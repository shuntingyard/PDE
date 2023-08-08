require('rust-tools').setup({
  server = {
    -- Replicate what we map when a LSP connects to a particular buffer.
    on_attach = require('lsp-zero').on_attach
  }
})

-- vim: ts=2 sts=2 sw=2 et

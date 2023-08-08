local M = {}

M.dap = {
  plugin = true,          -- Map only when plugin loaded.
  n = {                   -- Only in normal (n) mode.
    ["<leader>db"] = {    -- Mnemonic: debug breakpoint
      "<cmd> DapToggleBreakpoint <CR>",
      "Debug toggle breakpoint"
    },

    ["<leader>dus"] = {   -- Mnemonic: debug (open) UI sidebar
      function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Debug open UI sidebar"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {   -- Mnemonic: debug python run
      function()
        require("dap-python").test_method()
      end,
      "Debug Pyton run test_method"
    }
  }
}

return M

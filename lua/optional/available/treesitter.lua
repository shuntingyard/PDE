-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',   -- See `:help nvim-treesitter`
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    -- Use `:TSPlaygroundToggle` to switch on. Then on the resulting window:
    --  press 'o' and move to the window thus opened,
    --  enter a Scheme query like e.g. `(comment) @value`
    --  and see some magic happpen.
    'nvim-treesitter/playground',
  },
  build = ':TSUpdate'
}

-- vim: ts=2 sts=2 sw=2 et

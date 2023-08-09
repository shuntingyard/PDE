-- Define commands used in menus items below.
vim.api.nvim_create_user_command('MyOldfiles', function()
  if pcall(require, 'telescope') then
    vim.cmd(':Telescope oldfiles')
  else
    vim.cmd.oldfiles()
  end
end, {})

vim.api.nvim_create_user_command('MyTutor', function()
  if pcall(require, 'vim-be-good') then
    vim.cmd(':VimBeGood')
  else
    vim.cmd(':Tutor')
  end
end, {})

-- End command definitions. Do greeter setup.
local db = require('dashboard')

local stats = require('lazy').stats
local loaded = stats().loaded
local loadtime = tonumber(string.format('%.2f', stats().times.LazyDone - stats().times.LazyStart))

db.setup({
  hide = { statusline = true, tabline = true, winbar = true },
  theme = 'doom',
  config = {
    header = {
      [[_________            .___                                        ]],
      [[\_   ___ \  ____   __| _/____                                    ]],
      [[/    \  \/ /  _ \ / __ _/ __ \                                   ]],
      [[\     \___(  <_> / /_/ \  ___/                                   ]],
      [[ \______  /\____/\____ |\___  >                                  ]],
      [[        \/    ________.__   \/             __  .__               ]],
      [[             /   _____|  |__  __ __  _____/  |_|__| ____   ____  ]],
      [[             \_____  \|  |  \|  |  \/    \   __|  |/    \ / ___\ ]],
      [[             /        |   Y  |  |  |   |  |  | |  |   |  / /_/  >]],
      [[ _______    /__.____  |___|  |____/|___|  |__| |__|___|  \___  / ]],
      [[ \      \___  _|__| _____  \/           \/             \/_____/  ]],
      [[ /   |   \  \/ |  |/     \                                       ]],
      [[/    |    \   /|  |  Y Y  \                                      ]],
      [[\____|__  /\_/ |__|__|_|  /                                      ]],
      [[        \/              \/                                       ]],
      [[]],
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Explore files (netrc)                    ',
        key = 'n',
        key_hl = 'Number',
        action = ':Explore'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Recently opened',
        key = 'r',
        key_hl = 'Number',
        action = ':MyOldfiles'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Plugin manager',
        key = 'p',
        key_hl = 'Number',
        action = ':Lazy'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Learn Vim Movements with Tutor or VimBeGood',
        key = 't',
        key_hl = 'Number',
        action = ':MyTutor',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Quit',
        key = 'q',
        key_hl = 'Number',
        action = ':q',
      },
    },
    footer = { 'Lazy loaded ' .. loaded .. ' plugins in ' .. loadtime .. 'ms' }
  }
})

-- vim: ts=2 sts=2 sw=2 et
